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

    private var mapView : GMSMapView!
    private var locationManager = CLLocationManager()
    private var currentPosition : CLLocation?
    var zoomLevel: Float = 15.0
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.distanceFilter = 50
        locationManager.startUpdatingLocation()
        locationManager.delegate = self

        
        let asset = NSDataAsset(name: "MockData", bundle: Bundle.main)
        let data = asset?.data
        let users = try? JSONDecoder().decode(PosterUser.self, from: data!)
        let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        print(json)
        
        let position = CLLocationCoordinate2D()
        let camera = GMSCameraPosition.camera(withTarget: position, zoom: zoomLevel)
        
        mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        mapView.isMyLocationEnabled = true
        mapView.settings.myLocationButton = true
        
        mapView.isHidden = true
        mapView.frame = view.frame
        
        spinner.tintColor = UIColor.black
        
        //var marker = new Marker();
        //marker.Position = new CoreLocation.CLLocationCoordinate2D(latitude: position.Latitude, longitude: position.Longitude);
        //marker.Icon = UIImage.FromBundle("MeIcon");
        //marker.Map = _mapView;
        
        
    }

}

extension MapViewController : CLLocationManagerDelegate{
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.last!
        print("$$$ Location: \(location)")
        
        let camera = GMSCameraPosition.camera(withLatitude: location.coordinate.latitude,
                                              longitude: location.coordinate.longitude,
                                              zoom: zoomLevel)
        
        if mapView.isHidden {
            view.addSubview(mapView)
            mapView.isHidden = false
            mapView.camera = camera
            
            spinner.stopAnimating()
        } else {
            mapView.animate(to: camera)
        }
    }
}
