//
//  HomeVC+LocationDelegate.swift
//  MlagTackr
//
//  Created by Najeh on 03/09/2022.
//

import CoreLocation

extension HomeVC:CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let loc = locations.last else { return }
        print("count \(locations.count)")
        if isFirstLocation {
            lat = loc.coordinate.latitude
            lng = loc.coordinate.longitude
            UserDefaults.standard.set(lat, forKey: "lat")
            UserDefaults.standard.set(lng, forKey: "lng")
            isFirstLocation = false
        }
        
        if loc.coordinate.latitude == lat && loc.coordinate.longitude == lng {
            print("same")
            count += 1
        }else{
            print("not same")
            count = 0
            lat = loc.coordinate.latitude
            lng = loc.coordinate.longitude
            updateOnFirebase(lat: lat, lng: lng)
        }
        
        
        if count > 10 {
            print("timmmmmmmmmmout")
            addTrip()
            count = 0
            tripNum += 1
        }
        print("first \(UserDefaults.standard.value(forKey: "lng") ?? "")")
        print(loc.coordinate)
    }
}
