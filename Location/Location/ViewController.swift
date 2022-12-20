//
//  ViewController.swift
//  Location
//
//  Created by BOBBY ROOTS on 12/20/22.
//

import UIKit
import CoreLocation


class ViewController: UIViewController {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
    }


}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ _manager: CLLocationManager, didUpdateLocations
locations: [CLLocation]) {
        if let location = locations.first {
            print("lat: \(location.coordinate.latitude), long: \(location.coordinate.longitude)")
        }
        
    }
}
