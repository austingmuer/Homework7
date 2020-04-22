//
//  GPSViewController.swift
//  Homework7
//
//  Created by Austin Gmuer on 4/21/20.
//  Copyright © 2020 Austin Gmuer. All rights reserved.
//

import UIKit
import CoreLocation


class GPSViewController: UIViewController, CLLocationManagerDelegate {
    
    
    
    @IBOutlet weak var distanceLabel: UILabel!
    
    
    let locMan: CLLocationManager = CLLocationManager()
        var startLocation: CLLocation!
        
        //SHU
        let kshuLatitude: CLLocationDegrees = 37.933179
        let kshuLongitude: CLLocationDegrees = -75.3788086
        
        
        
        func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
            
            let newLocation: CLLocation=locations[0]
            NSLog("Something is happening!")
            
            //horizontal accuracy less than 0 means failure at gps level
            if newLocation.horizontalAccuracy >= 0 {
                
                let shu:CLLocation = CLLocation(latitude: kshuLatitude, longitude: kshuLongitude)
                
                let delta:CLLocationDistance = shu.distance(from: newLocation)
                
                let miles: Double = (delta * 0.000621371) + 0.5
                
                if miles < 3 {
                    //stop updting the location
                    locMan.stopUpdatingLocation()
                    //congratulate the user
                    distanceLabel.text = "Enjoy\nSeton Hill University!"
                    
                } else {
                    let commaDelimited: NumberFormatter = NumberFormatter()
                    commaDelimited.numberStyle = NumberFormatter.Style.decimal
                    
                    distanceLabel.text = commaDelimited.string(from: NSNumber(value: miles))!+" miles from SHU."
                }
            } else {
                //add action if error with gps
            }
            
        }
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            locMan.delegate = self
            locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
            locMan.distanceFilter = 1609;
            locMan.requestWhenInUseAuthorization()
            locMan.startUpdatingLocation()
            startLocation = nil
            // Do any additional setup after loading the view.
        }


    }

