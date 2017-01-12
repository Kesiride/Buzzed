//
//  MapListViewController.swift
//  Buzzed
//
//  Created by Jack Carlson on 11/10/15.
//  Copyright © 2015 CS378. All rights reserved.
//

import MapKit
import UIKit
//import CoreLocation

class MapListViewController : UIViewController, MKMapViewDelegate, CLLocationManagerDelegate, UITableViewDelegate{
    
    
    @IBOutlet var mapView: MKMapView!{
        didSet{
            mapView.delegate = self
            self.mapView.showsUserLocation = true
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let theSpan:MKCoordinateSpan = MKCoordinateSpanMake(0.01, 0.01)
        let location = CLLocationCoordinate2DMake(30.267, -97.7375)
        let startRegian:MKCoordinateRegion = MKCoordinateRegionMake(location, theSpan)
        
        mapView.setRegion(startRegian, animated: true)
        mapView.showsUserLocation = true
        
        let numBars = data.getCount()
        
        var i = 0
        while i < numBars {
            /*
            
            //Shakespeares
            let l1 = CLLocationCoordinate2DMake(30.267388, -97.739778)
            let a1 = MKPointAnnotation()
            a1.coordinate = l1
            a1.title = "Shakespeare's"
            a1.subtitle = "2$ Margs"
            mainMap.addAnnotation(a1)
            
            */
            var thisBar = data.getBar(i)
            var loc = CLLocationCoordinate2DMake(thisBar.lat, thisBar.long)
            let ann = MKPointAnnotation()
            //var annotationView = mapView(ann, viewForAnnotation: <#T##MKAnnotation#>)
            ann.coordinate = loc
            ann.title = thisBar.name
            let numDeals = thisBar.getDealCount()
            ann.subtitle = "\(numDeals) deals"
            mapView.addAnnotation(ann)
            i += 1
        }
        
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        let identifier = "Annotation id"
        var view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if view == nil{
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            view!.canShowCallout = true
        } else {
            view!.annotation = annotation
        }
        
        view?.leftCalloutAccessoryView = nil
        view?.rightCalloutAccessoryView = UIButton(type: UIButtonType.detailDisclosure)
        //swift 1.2
        //view?.rightCalloutAccessoryView = UIButton.buttonWithType(UIButtonType.DetailDisclosure) as UIButton
        
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        if (control as? UIButton)?.buttonType == UIButtonType.detailDisclosure {
            mapView.deselectAnnotation(view.annotation, animated: false)
            performSegue(withIdentifier: "Annotation id", sender: view.annotation)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Annotation id" {
            if let vc = segue.destination as? DescriptionViewController {
                let numBars = data.getCount()
                var i = 0
                while i < numBars{
                    var thisBar = data.getBarFromName(((sender as AnyObject).title)!)
            
                    //var thisBar = data.getBar(i)
                    vc.storeName = thisBar.name
                    vc.barDelegate = thisBar
                    i += 1
                }
            }
        }
    }
    
    
    
}

