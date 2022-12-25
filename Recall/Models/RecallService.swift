/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A class to fetch and cache data from the remote server.
 
 Copyright © 2021 Apple Inc.
 Modified by Gineton Alencar
 */

import Foundation
// TODO: Refactor for FDA API
actor RecallService {
    private let cache: NSCache<NSString, CacheEntryObject> = NSCache()
    // FDA API for JSON
    private let feedURL = URL(string: "https://api.fda.gov/food/enforcement.json?search=state:CA+AND+status:ongoing&limit=10&sort=report_date:dec")!
    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()

    private let downloader: any HTTPDataDownloader

    var products: [Product] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allProducts = try decoder.decode(JSON.self, from: data)
            var updatedProducts = allProducts.products
            let indexRange = updatedQuakes.startIndex..<olderThanOneHour
            try await withThrowingTaskGroup(of: (Int, QuakeLocation).self) { group in
                for index in indexRange {
                    group.addTask {
                        let location = try await self.quakeLocation(from: allQuakes.quakes[index].detail)
                        return (index, location)
                    }
                }
                while let result = await group.nextResult() {
                    switch result {
                    case .failure(let error):
                        throw error
                    case .success(let (index, location)):
                        updatedQuakes[index].location = location
                    }
                }
            }
        }
            return updatedQuakes
    }
}

    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }

    func quakeLocation(from url: URL) async throws -> QuakeLocation {
        if let cached = quakeCache[url] {
            switch cached {
            case .ready(let location):
                return location
            case .inProgress(let task):
                return try await task.value
            }
        }
        let task = Task<QuakeLocation, Error> {
            let data = try await downloader.httpData(from: url)
            let location = try decoder.decode(QuakeLocation.self, from: data)
            return location
        }
        quakeCache[url] = .inProgress(task)
        do {
            let location = try await task.value
            quakeCache[url] = .ready(location)
            return location
        } catch {
            quakeCache[url] = nil
            throw error
        }
    }
}
