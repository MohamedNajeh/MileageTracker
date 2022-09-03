//
//  MapVC.swift
//  MlagTackr
//
//  Created by Najeh on 01/09/2022.
//

import UIKit
import MapKit
import CoreLocation
import FirebaseDatabase
class MapVC: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    var loc1:CLLocationCoordinate2D!
    var loc2:CLLocationCoordinate2D!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        mapView.showRouteOnMap(pickupCoordinate: loc1, destinationCoordinate: loc2)
    }
}


extension MapVC:MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        let renderer = MKPolylineRenderer(overlay: overlay)
        renderer.strokeColor = UIColor.red
        renderer.lineWidth = 5.0
        return renderer
    }
}
