//
//  organizerView2
//  reviewPreview
//
//  Created by David Kim on 2/22/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class organizerView2: UIViewController,MKMapViewDelegate,CLLocationManagerDelegate {
    // -------------------------------------------------------//
    var receivedOccasion = ""
    var receivedSessionDate = ""
    var receivedCourseName = ""
    var receivedOrganizerName = ""
    var receivedOccasionDate = ""
    // -------------------------------------------------------//
    let locationManager = CLLocationManager()
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var userLocationInput: UITextField!

    // send data over to fullView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// get a reference to the second view controller
        let fullViewTableViewController = segue.destination as! fullViewTableViewController
        // set a variable in the second view controller with the String to pass
        fullViewTableViewController.receivedOccasion = receivedOccasion
        fullViewTableViewController.receivedSessionDate = receivedSessionDate
        fullViewTableViewController.receivedCourseName = receivedCourseName
        fullViewTableViewController.received4 = userLocationInput.text!
        fullViewTableViewController.receivedOrganizerName = receivedOrganizerName
        fullViewTableViewController.receivedOccasionDate = receivedOccasionDate
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        mapview.mapType = .standard
        mapview.delegate = self
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()

        let initialLocation = CLLocation(latitude: 40.7450, longitude: -74.0238)
        centerMapOnLocation(location: initialLocation)
    }
    let regionRadius: CLLocationDistance = 1000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegion(center: location.coordinate,
                                                  latitudinalMeters: regionRadius, longitudinalMeters: regionRadius)
        mapview.setRegion(coordinateRegion, animated: true)
    }
    @IBAction func switchMapType(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            mapview.mapType = .standard
        case 1:
            mapview.mapType = .hybridFlyover
        default:
            break
        }
    }
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        mapview.showsUserLocation = (status == .authorizedWhenInUse)
    }

}
