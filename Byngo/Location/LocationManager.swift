//
//  LocationManager.swift
//  Byngo
//
//  Created by felix on 29/10/2021.
//

import CoreLocation
import Foundation
import MapKit
import SwiftUI


class Choice:ObservableObject{
    @Published var choice: Int = 0
}

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    @ObservedObject var choice = Choice()
    
    @Published var showAlert: Bool = false
    @Published var tmp1: Bool = true
    @Published var tmp2: Bool = true
    @State var planeLocation = CLLocation(latitude: 22.308, longitude: 113.9185)
    @State var postLocation = CLLocation(latitude: 22.2836, longitude: 114.1596)
    @State var shipLocation = CLLocation(latitude: 22.2938, longitude: 114.1687)
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
    
    func checkLocation(){
        let radius: Double = 1000
        let planeDistance = userLocation.distance(from: planeLocation)
        let postDistance = userLocation.distance(from: postLocation)
        let shipDistance = userLocation.distance(from: shipLocation)
        
        if (planeDistance < radius ){
            tmp1 = true
            choice.choice = 1
        } else if (postDistance<radius){
            tmp1 = true
            choice.choice = 2
        } else if (shipDistance<radius){
            tmp1 = true
            choice.choice = 0
        }else{
            tmp1 = false
        }
        
        if(tmp1 == true){
            if (tmp2 == true){
                showAlert=true
            }
            else if(tmp2 == false){
                showAlert=false
            }
            
        }else{
            showAlert=false
        }
    }
}
