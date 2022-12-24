//
//  RecallsModel.swift
//  Recall Ready
//
//  Abstract:
//  Contains the model for product recalls with the properties in the FDA Recall API.
//
//  Created by Gineton Alencar II based on work by Bobby Roots.
//

//import Foundation
//import SwiftUI
//
//struct Response: Codable {
//    var results: [Product]
//}
//
//struct Product:Codable {
//    var status: String
//    
//    // location properties
//    // TODO: maybe implement as var location: ProductLocation?
//    var city: String
//    var state: String
//    var country: String
//    var address_1: String
//    var address_2: String
//    var postal_code: String
//    var distribution_pattern: String
//    
//    var classification: String
//    var product_type: String
//    var event_id: Int
//    var recalling_firm: String
//    var voluntary_mandated: String
//    var recall_number: String
//    var product_description: String
//    var product_quantity: String
//    var reason_for_recall: String
//    
//    //dates
//    var recall_initiation_date: String
//    var center_classification_date: String
//    var report_date: String
//    
//}
//
//extension Product {
//    static var preview: Product {
//        let product = Product(status: "Ongoing", city: "Vernon", state: "CA", country: "United States", address_1: "2376 E 48th St", address_2: "", postal_code: "90058-2026", distribution_pattern: "Product was distributed to 18 distributors and 10 retail locations located in CA, MN, UT, AZ, OH, FL, IL, WA, IN, MI, TX, and GA.", classification: "Class I", product_type: "Food", event_id: 91167, recalling_firm: "GREEN DAY PRODUCE", voluntary_mandated: "Voluntary: Firm initiated", recall_number: "F-0183-2023", product_description: "Enoki Mushroom Net wt. 200g (7.05 oz.) 25 units per case UPC: 16430-69080 Keep refrigerated Product of Korea", product_quantity: "1512 cases, 25 units per case", reason_for_recall: "Product found to be contaminated with Listeria monocytogenes", recall_initiation_date: "20221117", center_classification_date: "20221202", report_date: "20221214")
//        return product
//    }
//}
