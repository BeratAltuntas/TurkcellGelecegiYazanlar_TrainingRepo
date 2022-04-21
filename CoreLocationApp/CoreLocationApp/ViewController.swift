//
//  ViewController.swift
//  CoreLocationApp
//
//  Created by BERAT ALTUNTAŞ on 21.04.2022.
//
import CoreLocation
import MapKit
import UIKit

class ViewController: UIViewController,CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    var locationManager: CLLocationManager!
    var currentLocation: CLLocation = CLLocation.init(latitude: 0, longitude: 0)
    var yourCurrentLocation: Location!
    override func viewDidLoad() {
        super.viewDidLoad()
        getLocation()
        
        
        
    }
    
    func getLocation(){
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        if CLLocationManager.locationServicesEnabled(){
            locationManager.startUpdatingLocation()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations[0]
        print("location : \(location.coordinate.latitude) -  \(location.coordinate.longitude)")
        currentLocation = CLLocation.init(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        if yourCurrentLocation != nil{
            mapView.removeAnnotation(yourCurrentLocation)
        }
        yourCurrentLocation = Location(coordinate: currentLocation.coordinate)
        mapView.addAnnotation(yourCurrentLocation)
    }


}


class Location : NSObject, MKAnnotation
{
    var coordinate: CLLocationCoordinate2D
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
    }
}
