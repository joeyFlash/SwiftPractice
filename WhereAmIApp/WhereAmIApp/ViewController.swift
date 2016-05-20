//
//  ViewController.swift
//  WhereAmIApp
//
//  Created by Joseph Hernandez on 5/18/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController,CLLocationManagerDelegate {

    var locationManager = CLLocationManager()
    
    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    @IBOutlet var courseLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var altitudeLabel: UILabel!
    
    @IBOutlet var addressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print(locations)
        
        var userLocation:CLLocation = locations[0] as CLLocation
        self.latitudeLabel.text = "\(userLocation.coordinate.latitude)"
        self.longitudeLabel.text = "\(userLocation.coordinate.longitude)"
        self.courseLabel.text = "\(userLocation.course)"
        self.speedLabel.text = "\(userLocation.speed)"
        self.altitudeLabel.text = "\(userLocation.altitude)"
        
        CLGeocoder().reverseGeocodeLocation(userLocation) { (placemarks, error) in
            if(error != nil)
            {
                print(error)
            }
            else
            {
                if let p = placemarks?.first
                {
                    print(p)
                    
                    let subThoroughFare = p.subThoroughfare ?? ""
                    let thoroughFare = p.thoroughfare ?? ""
                    let subLocaility = p.subLocality ?? ""
                    let subAdministrativeArea = p.subAdministrativeArea ?? ""
                    let postalCode = p.postalCode ?? ""
                    let country = p.country ?? ""
                    
                    self.addressLabel.text = "\(subThoroughFare) \(thoroughFare) \n \(subLocaility) \n \(subAdministrativeArea) \n \(postalCode) \(country)"

                }
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

