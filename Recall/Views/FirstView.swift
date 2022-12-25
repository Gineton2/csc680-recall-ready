//
//  FirstView.swift
//  Recall
//
//  Created by Gineton Alencar II on 12/22/22.
//
//  Resources:
//  https://developer.apple.com/documentation/corelocationui/cllocationbutton

import SwiftUI
import CoreLocationUI
import CoreLocation

// This is the first view that the user will see.
// Show app Title "Recall Ready" and a button to get user location.
struct FirstView: View {
    @EnvironmentObject var locationService : LocationService
    @State private var showProducts = false
    
    var body: some View {
        NavigationView() {
        VStack {
            Image("Logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300, alignment: .center)
            
            Text("Recall Ready")
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Text("\tRecall Ready provides up-to-date information on FDA food recalls in your region. \r\tStay informed! Keep you and your family safe from foodborne illness and other health risks.")
                .font(.callout)
                .padding([.trailing, .bottom, .leading], 40)
                .padding(.top, 5)
                
                NavigationLink(destination: Products(), isActive: $showProducts) {
                    LocationButton(.currentLocation){
                        self.locationService.startGeocoding()
                        self.showProducts = true
                    }
                    .symbolVariant(.fill)
                    .labelStyle(.titleAndIcon)
                    .cornerRadius(25.0)
                    .foregroundColor(Color.white)
                }
            }
        }
    }
}
struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
            .environmentObject(LocationService())
    }
}
