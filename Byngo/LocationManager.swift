//
//  LocationManager.swift
//  Byngo
//
//  Created by felix on 29/10/2021.
//

import CoreLocation
import Foundation
import MapKit



class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    
    @Published var showAlert: Bool = false
    @Published var venueLocation = CLLocation(latitude: 22.283, longitude: 114.1371)
    private let locationManager=CLLocationManager()
    @Published var userLocation:CLLocation = CLLocation()

    override init() {
        super.init()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        userLocation = locations[0]
    }
    
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        if locationManager.authorizationStatus == .authorizedAlways ||
            locationManager.authorizationStatus == .authorizedWhenInUse {
            locationManager.startUpdatingLocation()
        }
    }
    
    @objc func checkLocation(){
        let radius: Double = 8000
        let distance = userLocation.distance(from: venueLocation)
        
        if (distance < radius ){
            showAlert = true
        }
    }
}
