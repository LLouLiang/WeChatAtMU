//
//  MapViewController.swift
//  Wechat@MU
//
//  Created by LiangLyu on 12/3/16.
//  Copyright © 2016 LiangLyu. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
 
    @IBOutlet weak var mapview: MKMapView!
    var selectedimage: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location:CLLocation){
        let coordinateRgion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius * 2.0, regionRadius * 2.0)
        mapview.setRegion(coordinateRgion, animated: true)
    }
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        let scenelatitude = (selectedimage["latitude"] as! NSString).doubleValue
        let scenelongtitude = (selectedimage["longtitude"] as! NSString).doubleValue
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestAlwaysAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapview.showsUserLocation = true
        mapview.mapType = MKMapType.Satellite
        self.locationManager.requestWhenInUseAuthorization()
        if (CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedAlways ||
            CLLocationManager.authorizationStatus() == CLAuthorizationStatus.AuthorizedWhenInUse){
            let currentLocation:CLLocation = self.locationManager.location!
            let currLocation:CLLocation = CLLocation(latitude: currentLocation.coordinate.latitude, longitude: currentLocation.coordinate.longitude)
            let sceneLocation:CLLocation = CLLocation(latitude: scenelatitude, longitude: scenelongtitude)
            let distMeter = String(sceneLocation.distanceFromLocation(currLocation))
            let address: String = "Your Distance:" + (distMeter) + "m"
            
            let scene = Scene(titlename: selectedimage["name"] as! String,location: address,discipline: "Historic",coordinate: CLLocationCoordinate2D(latitude: scenelatitude, longitude:  scenelongtitude))
            self.mapview.addAnnotation(scene)
            self.mapview.delegate = self
        }
        
        
    }
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
        self.mapview.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
