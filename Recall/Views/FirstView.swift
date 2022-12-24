//
//  FirstView.swift
//  Recall
//
//  Created by Gineton Alencar II on 12/22/22.
//

import SwiftUI
import CoreLocationUI

// This is the first view that the user will see.
// Show app Title "Recall Ready" and a button to get user location.
struct FirstView: View {
    @StateObject var locationService = LocationService()
    
    var body: some View {
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
            
            LocationButton(.currentLocation){
            }
            .symbolVariant(.fill)
            .labelStyle(.titleAndIcon)
            .cornerRadius(25.0)
        }
    }
}

struct FirstView_Previews: PreviewProvider {
    static var previews: some View {
        FirstView()
    }
}
