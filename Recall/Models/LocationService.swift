//
//  Location.swift
//  Abstract:
//  Functionality to get the user's location.
//  The location will be converted into a string with the User's State.
//  This will be sent to the FDA API to get relevant data.
//
//  Created by Gineton Alencar II on 12/23/22.
//
//  References:
//  https://www.hackingwithswift.com/quick-start/swiftui/how-to-read-the-users-location-using-locationbutton
//  https://developer.apple.com/documentation/corelocationui/sharing_your_location_to_find_a_park
// https://cocoacasts.com/reverse-geocoding-with-clgeocoder

import CoreLocation

//  Functionality to get the user's location.
//  The location will be converted into a string with the User's State.
//  This will be sent to the FDA API to get relevant data.

class LocationService: NSObject, ObservableObject, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    @Published var location: CLLocation?
    @Published var locationState: String = "" //"CA" for testing
    
    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
        // Maybe unnecessary:
        //        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //        locationManager.requestWhenInUseAuthorization()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
    
    func requestLocation() {
        locationManager.requestLocation()
    }
    
    func startGeocoding() { // completion handler was not working
        guard let location = location else {
//            completion(false)
            return
        }
        let geocoder = CLGeocoder()
        geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                self.locationState = firstLocation?.administrativeArea ?? ""
                //                completion(true)
            } //else {
            //  completion(false)
            //}
        }
    }
