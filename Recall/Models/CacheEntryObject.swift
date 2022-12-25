/*
 See LICENSE folder for this sample’s licensing information.

 Abstract:
 A class for caching quake data.
 
 Copyright © 2021 Apple Inc.
 Modified by Gineton Alencar
*/

import Foundation

/// A class to hold a CacheEntry.
final class CacheEntryObject {
    let entry: CacheEntry
    init(entry: CacheEntry) { self.entry = entry }
}

/// An enumeration of cache quake cache entries.
enum CacheEntry {
    case inProgress(Task<Product, Error>)
    case ready(Product)
}
