/*
See LICENSE folder for this sample’s licensing information.

Abstract:
An enumeration of Quake fetch and consumption errors.
 
Copyright © 2021 Apple Inc.
Modified by Gineton Alencar
*/

import Foundation

enum RecallError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension RecallError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Discarding a product recall missing a valid data item.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching recall data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
