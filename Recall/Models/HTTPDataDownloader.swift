/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A protocol describing an HTTP Data Downloader.
 
 Copyright © 2021 Apple Inc.
 Modified by Gineton Alencar
 */

import Foundation

let validStatus = 200...299
/// A protocol describing an HTTP Data Downloader.
protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw RecallError.networkError
        }
        return data
    }
}
