//
//  ViewController.swift
//  SimpleSpeed
//
//  Created by Gabe on 12/22/14.
//  Copyright (c) 2014 Gabe. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    var bool = false
    var finalSpeed = "nil"
    var mphSpeed = 1
    var kphSpeed = 1
    
    @IBOutlet weak var speedLabel: UILabel!

    @IBOutlet weak var Button: UIButton!
    @IBAction func Button(sender: AnyObject) {
        if (bool == false) {
            Button.setTitle("KPH", forState: UIControlState.Normal)
            bool = true
            finalSpeed = "\(kphSpeed)"

        }
        else {
            Button.setTitle("MPH", forState: UIControlState.Normal)
            bool = false
            finalSpeed = "\(mphSpeed)"

        }
    }
    var manager:CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
    
    }
    
  
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [AnyObject]!) {
        
        var userSpeed:CLLocation = locations[0] as CLLocation
    
        var mphSpeed = round(userSpeed.speed * 2.23693629)
        println("MPH:\(mphSpeed)")
        
        var kphSpeed = round(userSpeed.speed * 3.6)
        //println(kphSpeed)
        
        finalSpeed = "\(mphSpeed)"
        
        let stringLength = countElements(finalSpeed)
        let substringIndex = stringLength - 2
        var a = finalSpeed.substringToIndex(advance(finalSpeed.startIndex, substringIndex))
       
            speedLabel.text = a
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

