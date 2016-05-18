//
//  ViewController.swift
//  MapsApp
//
//  Created by Joseph Hernandez on 5/10/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    
    @IBOutlet var mapView: MKMapView!
    
    var locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
        var latitude: CLLocationDegrees = 35.172910
        
        var longitude: CLLocationDegrees = -106.590837
        
        var latDelta: CLLocationDegrees = 0.01
        
        var longDelta: CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Ultramain Systems"
        annotation.subtitle = "I work here!"
        mapView.addAnnotation(annotation)
        
        var uilpgr = UILongPressGestureRecognizer(target: self, action: "action:")
        uilpgr.minimumPressDuration = 2
        mapView.addGestureRecognizer(uilpgr)
    }

    
    func action(gestureRecognizer: UIGestureRecognizer)
    {
        print("Gesture Recgonized")
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        var newCoordinate: CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        var annotation = MKPointAnnotation()
        annotation.coordinate = newCoordinate
        annotation.title = "New Place"
        annotation.subtitle = "I dont work here!"
        mapView.addAnnotation(annotation)
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation: CLLocation = locations[0] as! CLLocation
        var latitude = userLocation.coordinate.latitude
        var longitude = userLocation.coordinate.longitude
        var latDelta: CLLocationDegrees = 0.01
        
        var longDelta: CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        self.mapView.setRegion(region, animated: false)
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

