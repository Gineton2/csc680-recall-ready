
//  RecallDetailView.swift
//  Recall
//
//  Created by Gineton Alencar II on 12/22/22.
//

import SwiftUI

struct ProductDetails: View {
    var product: Product
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Product: \n" + product.product_description.prefix(60) + "...")
                .font(.headline)
            Text("City: " + product.city)
            Text("Product Description:\n" + product.product_description)
                .font(.headline)
            Text("Reason for Recall:\n" + product.reason_for_recall)
                .font(.headline)
        }
        .padding()
    }
    
    struct ProductDetails_Previews: PreviewProvider {
        static var previews: some View {
            ProductDetails(product: Product.preview)
        }
    }
}
