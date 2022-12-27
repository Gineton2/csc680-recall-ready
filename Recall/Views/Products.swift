//
//  RecallsView.swift
//  Recall
//
//  Created by BOBBY ROOTS on 12/20/22. Edited by Gineton Alencar.


import SwiftUI

struct Products: View {
    // to make use of user's locationState
    @EnvironmentObject var locationService : LocationService
    @State private var products = [Product]()

    var body: some View {
        NavigationView {
            List(products, id: \.recall_number) { product in
                NavigationLink (destination: ProductDetails(product: product)) {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Product: \n" + product.product_description.prefix(60) + "...")
                            .font(.headline)
                        Text("City: " + product.city)
//                       Text(product.product_description)
//                           .font(.headline)
//                       Text(product.reason_for_recall)
                    }
                }
            }
        }
        .task {
            await loadData()
        }
    }
    func loadData() async {
        let state = locationService.locationState
        guard let url = URL(string: "https://api.fda.gov/food/enforcement.json?search=state:\(state)+AND+status:ongoing&limit=10&sort=report_date:dec") else
        {
            print("Invalid URL")
            return
        }
        do {
            // use locationState in API Request
            let (data, _) = try await URLSession.shared.data(from: url)
            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                products = decodedResponse.results
            }
        } catch {
            print("Invalid data")
        }
    }
}

struct Products_Previews: PreviewProvider {
    static var previews: some View {
        Products()
            .environmentObject(LocationService())
    }
}
