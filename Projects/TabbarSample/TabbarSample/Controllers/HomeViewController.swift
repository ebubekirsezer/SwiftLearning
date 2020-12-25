//
//  HomeViewController.swift
//  TabbarSample
//
//  Created by Ebubekir Sezer on 24.12.2020.
//

import UIKit
import MapKit

class HomeViewController: UIViewController {
    
    var mapView = MKMapView()
    let locationManager = CLLocationManager()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.tintColor = UIColor.black
        self.tabBarController?.tabBar.barTintColor = UIColor.purple
        self.tabBarController?.tabBar.unselectedItemTintColor = UIColor.white
        
        
        self.navigationController?.tabBarItem.image = UIImage(systemName: "homekit")
        self.navigationController?.title = "Home"
        self.navigationItem.title = "Home"
        
        
        //Map View
        
        mapView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        
        self.view.addSubview(mapView)

        let coordinate = CLLocationCoordinate2D(latitude: 25.1972, longitude: 55.2744)
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: coordinate, span: span)
        
        mapView.setRegion(region, animated: true)
        
        let pin = MKPointAnnotation()
        pin.coordinate = CLLocationCoordinate2D(latitude: 25.1972, longitude: 55.2744)
        pin.title = "Burj Khalifa"
        pin.subtitle = "Tallest building in the world"
        mapView.addAnnotation(pin)
        
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestWhenInUseAuthorization()
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            mapView.showsUserLocation = true
            locationManager.delegate = self
            
            centreOnUserLocation()
        }
    }
    
    func centreOnUserLocation(){
        if let location = locationManager.location?.coordinate{
            let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            let region = MKCoordinateRegion(center: location, span: span)
            mapView.setRegion(region, animated: true)
        }
    }
}


extension HomeViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        
        let centre = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        
        let span = MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
        let region = MKCoordinateRegion(center: centre, span: span)
        mapView.setRegion(region, animated: true)
    }
}
