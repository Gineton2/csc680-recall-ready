//
//  RecallsModel.swift
//  Recall
//
//  Created by Gineton Alencar II on 12/22/22.
//

import Foundation
import SwiftUI

struct Response: Codable {
    var results: [Product]
}

struct Product:Codable {
    var recall_number: String
    var reason_for_recall: String
    var product_description: String
}
