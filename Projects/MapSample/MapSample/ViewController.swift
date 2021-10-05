//
//  ViewController.swift
//  MapSample
//
//  Created by Ebubekir Sezer on 10.06.2021.
//

import UIKit
import GoogleMaps
import GooglePlaces

class ViewController: UIViewController {

    @IBOutlet private weak var mapView: GMSMapView? {
        didSet {
            mapView?.delegate = self
        }
    }
    @IBOutlet private weak var labelDetail: UILabel?
    
    var locationManager: CLLocationManager?
    var currentLocation: CLLocation?
    var placesClient: GMSPlacesClient?
    var preciseLocationZoomLevel: Float = 20.0
    var approximateLocationZoomLevel: Float = 5.0
    
    var selectedPlace: GMSPlace?
    let placeFields: GMSPlaceField = [.name, .formattedAddress]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locationManager = CLLocationManager()
        locationManager?.desiredAccuracy = kCLLocationAccuracyBest
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.distanceFilter = 50
        locationManager?.startUpdatingLocation()
        locationManager?.delegate = self

        placesClient = GMSPlacesClient.shared()
        
        let defaultLocation = CLLocation(latitude: -33.869405, longitude: 151.199)
        let zoomLevel = locationManager?.accuracyAuthorization == .fullAccuracy ? preciseLocationZoomLevel : approximateLocationZoomLevel
        let camera = GMSCameraPosition.camera(withLatitude: defaultLocation.coordinate.latitude,
                                              longitude: defaultLocation.coordinate.longitude,
                                              zoom: zoomLevel)
        mapView?.camera = camera
        
        mapView?.settings.myLocationButton = true
        mapView?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

extension ViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        
        let zoomLevel = locationManager?.accuracyAuthorization == .fullAccuracy ? preciseLocationZoomLevel : approximateLocationZoomLevel
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        self.mapView?.camera = camera
        
        placesClient?.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: placeFields, callback: { (placeLikelihoods, error) in
            guard error == nil else {
                print("Current place error: \(error?.localizedDescription ?? "")")
                return
            }
            
            guard let place = placeLikelihoods?.first?.place else {
                print("No current place")
                return
            }
            
            self.labelDetail?.text = place.formattedAddress
        })
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        
        // Check accuracy authorization
        let accuracy = manager.accuracyAuthorization
        switch accuracy {
        case .fullAccuracy:
            print("Location accuracy is precise.")
        case .reducedAccuracy:
            print("Location accuracy is not precise.")
        @unknown default:
            fatalError()
        }
        
        // Handle authorization status
        switch manager.authorizationStatus {
        case .restricted:
            print("Location access was restricted.")
        case .denied:
            print("User denied access to location.")
            // Display the map using the default location.
            mapView?.isHidden = false
        case .notDetermined:
            print("Location status not determined.")
        case .authorizedAlways: fallthrough
        case .authorizedWhenInUse:
            print("Location status is OK.")
        @unknown default:
            fatalError()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        locationManager?.stopUpdatingLocation()
        print("Error: \(error)")
    }
}

extension ViewController: GMSMapViewDelegate {
        
    func mapView(_ mapView: GMSMapView, willMove gesture: Bool) {
        let centerCoordinate = CLLocationCoordinate2D(latitude: mapView.camera.target.latitude, longitude: mapView.camera.target.longitude)
        let geocoder = GMSGeocoder()
        geocoder.reverseGeocodeCoordinate(centerCoordinate) { response, error in
            if error != nil {
                print(error?.localizedDescription ?? "")
            } else {
                if let places = response?.results() {
                    if let place = places.first {
                        self.labelDetail?.text = place.lines?.first
                        print(place.lines?.first ?? "")
                    }
                }
            }
        }

        
//        let updatedCoorditane = CLLocation(latitude: mapView.camera.target.latitude, longitude: mapView.camera.target.longitude)
//        print(selectedPlace?.name)
//
//        placesClient?.findPlaceLikelihoodsFromCurrentLocation(withPlaceFields: placeFields, callback: { (placeLikelihoods, error) in
//            guard error == nil else {
//                print("Current place error: \(error?.localizedDescription ?? "")")
//                return
//            }
//
//            guard let place = placeLikelihoods?.first?.place else {
//                print("No current place")
//                return
//            }
//
//            self.labelDetail?.text = place.formattedAddress
//        })
    }
}
