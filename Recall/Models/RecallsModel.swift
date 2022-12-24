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
    var status: String
    
    // location properties
    // TODO: maybe implement as var location: ProductLocation?
    var city: String
    var state: String
    var country: String
    var address_1: String
    var address_2: String
    var postal_code: String
    var distribution_pattern: String
    
    var classification: String
    var product_type: String
    var event_id: String
    var recalling_firm: String
    var voluntary_mandated: String
    var recall_number: String
    var product_description: String
    var reason_for_recall: String
    
    //dates
    var recall_initiation_date: String
    var center_classification_date: String
    var report_date: String
    
}
