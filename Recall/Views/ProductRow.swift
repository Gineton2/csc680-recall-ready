//
//  ProductRow.swift
//  Recall
//
//  Created by Gineton Alencar II on 12/24/22.
//
//
//import SwiftUI
//
//struct ProductRow: View {
//    var product: Product
//
//    var body: some View {
//        VStack(alignment: .leading, spacing: 20) {
//            Text("Product: " + product.product_description.prefix(60) + "...")
//                .font(.headline)
//            Text("City: " + product.city)
//        }
//    }
//
//    struct ProductRow_Previews: PreviewProvider {
//        let dateFormat: () = DateFormatter()
//            .dateFormat = "yyyymmdd"
//
//        static var previewProduct = Product(status: "Ongoing", city: "Vernon", state: "CA", country: "United States", address_1: "2376 E 48th St", address_2: "", postal_code: "90058-2026", distribution_pattern: "Product was distributed to 18 distributors and 10 retail locations located in CA, MN, UT, AZ, OH, FL, IL, WA, IN, MI, TX, and GA.", classification: "Class I", product_type: "Food", event_id: 91167, recalling_firm: "GREEN DAY PRODUCE", voluntary_mandated: "Voluntary: Firm initiated", recall_number: "F-0183-2023", product_description: "Enoki Mushroom Net wt. 200g (7.05 oz.) 25 units per case UPC: 16430-69080 Keep refrigerated Product of Korea", product_quantity: "1512 cases, 25 units per case", reason_for_recall: "Product found to be contaminated with Listeria monocytogenes", recall_initiation_date: "20221117", center_classification_date: "20221202", report_date: "20221214")
//        static var previews: some View {
//            ProductRow(product: previewProduct)
//        }
//    }
//}
