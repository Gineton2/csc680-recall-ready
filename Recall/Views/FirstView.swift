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
            Text("Recall Ready")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.bottom, 10)
            
            Text("\tRecall Ready provides up-to-date information on food recall announcements by the FDA in a user's region. \r\tStay informed! Help keep you and your family safe from foodborne illness and other health risks.")
                .font(.callout)
                .italic()
                .padding(50)
            
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
