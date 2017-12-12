//
//  MapViewController.swift
//  LunchToday
//
//  Created by Admin on 12.12.2017.
//  Copyright © 2017 lunchtoday. All rights reserved.
//

import UIKit
import GoogleMaps;

class MapViewController: UIViewController {

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private let mapView : GMSMapView
    private var locationManager : CLLocationManager
    private let currentPosition : CLLocation
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager = CLLocationManager()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
        
        let position = CLLocation();
        let camera = GMSCameraPosition.camera(withTarget: position, zoom: 16)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        View = mapView
        
        //var marker = new Marker();
        //marker.Position = new CoreLocation.CLLocationCoordinate2D(latitude: position.Latitude, longitude: position.Longitude);
        //marker.Icon = UIImage.FromBundle("MeIcon");
        //marker.Map = _mapView;
        
        activityIndicator.StopAnimating();
    }

}

extension MapViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        currentPosition = locations.last
    }
}
