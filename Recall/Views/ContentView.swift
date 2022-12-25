
//
//  ContentView.swift
//  Recall
//
//  Created by BOBBY ROOTS on 12/20/22.
//
//import SwiftUI
//struct Response: Codable {
//    var results: [Result]
//}
//
//struct Result:Codable {
//    var recall_number: String
//    var reason_for_recall: String
//    var product_description: String
//
//}
//struct ContentView: View {
//    @State private var results = [Result]()
//    var body: some View {
//        List(results, id: \.recall_number) { item in
//            VStack(alignment: .leading, spacing: 20) {
//                Text(item.product_description)
//                    .font(.headline)
//                Text(item.reason_for_recall)
//
//            }
//        }
//        .task {
//            await loadData()
//        }
//    }
//    func loadData() async {
//        guard let url = URL(string: "https://api.fda.gov/food/enforcement.json?search=state:CA+AND+status:ongoing&limit=10&sort=report_date:dec") else
//        {
//            print("Invalid URL")
//            return
//        }
//        do {
//            let (data, _) = try await URLSession.shared.data(from: url)
//            if let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
//                results = decodedResponse.results
//            }
//        }catch{
//            print("Invalid data")
//        }
//
//    }
//}
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
