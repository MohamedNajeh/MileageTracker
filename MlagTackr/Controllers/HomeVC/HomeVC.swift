//
//  HomeVC.swift
//  MlagTackr
//
//  Created by Najeh on 01/09/2022.
//

import UIKit
import CoreLocation
import MapKit
import FirebaseDatabase

class HomeVC: UIViewController{
    
    @IBOutlet weak var noTripsLbl: UILabel!
    @IBOutlet weak var tableView: UITableView!
    var trips:[Trip] = []
    var lat = 0.0, lng = 0.0
    var count = 0 , tripNum = 1
    var isFirstLocation = true
    var locationManager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableView()
        setupLocationManager()
    }
    
    func addTrip(){
        let firstLocation = CLLocationCoordinate2D(latitude: UserDefaults.standard.value(forKey: "lat") as! Double, longitude: UserDefaults.standard.value(forKey: "lng") as! Double)
        let lastLocation = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        let trip = Trip(title: "Trip \(tripNum)", firstLocation: firstLocation, lastLocation: lastLocation)
        self.trips.append(trip)
        tableView.reloadData()
    }
    
    func setUpTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "tripCell", bundle: nil), forCellReuseIdentifier: "tripCell")
    }
    
    func updateOnFirebase(lat:Double,lng:Double){
        let ref = Database.database().reference()
        ref.child("location").child("latitude").setValue(["latitude": lat])
        ref.child("location").child("longitude").setValue(["longitude": lng])
    }
    
    func setupLocationManager(){
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.startUpdatingLocation()
            locationManager.allowsBackgroundLocationUpdates = true
            locationManager.pausesLocationUpdatesAutomatically = false
            locationManager.activityType = .fitness
            locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        }
    }
}
