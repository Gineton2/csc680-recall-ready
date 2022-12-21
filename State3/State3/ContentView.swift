//
//  ContentView.swift
//  State3
//
//  Created by BOBBY ROOTS on 12/20/22.
//

import SwiftUI

import MapKit
import Contacts

extension CLPlacemark {
    /// street name, eg. Infinite Loop
    var streetName: String? { thoroughfare }
    /// // eg. 1
    var streetNumber: String? { subThoroughfare }
    /// city, eg. Cupertino
    var city: String? { locality }
    /// neighborhood, common name, eg. Mission District
    var neighborhood: String? { subLocality }
    /// state, eg. CA
    var state: String? { administrativeArea }
    /// county, eg. Santa Clara
    var county: String? { subAdministrativeArea }
    /// zip code, eg. 95014
    var zipCode: String? { postalCode }
    /// postal address formatted
    @available(iOS 11.0, *)
    var postalAddressFormatted: String? {
        guard let postalAddress = postalAddress else { return nil }
        return CNPostalAddressFormatter().string(from: postalAddress)
    }
}

extension CLLocation {
    func placemark(completion: @escaping (_ placemark: CLPlacemark?, _ error: Error?) -> ()) {
        CLGeocoder().reverseGeocodeLocation(self) { completion($0?.first, $1) }
    }
}

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
        
            .task {
                await getState(lat: 37.331676, long: -122.030189 )
            }
        
    }
        
    func getState(lat: Double, long: Double) async {
        let location = CLLocation(latitude: lat , longitude: long )
        location.placemark { placemark, error in
            guard let placemark = placemark else {
                print("Error:", error ?? "nil")
                return
            }
            print(placemark.state ?? "")
        }

    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
