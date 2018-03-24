//
//  ViewController.swift
//  HomeSafe
//
//  Created by Alessia Masola on 24/03/2018.
//  Copyright © 2018 Alessia Masola. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController {

    @IBOutlet weak var viewConstraint: NSLayoutConstraint!
    @IBOutlet weak var blurView: UIVisualEffectView!
    @IBOutlet weak var sideView: UIView!
    
    //self.view.bringSubviewToFront(self.sideView)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        blurView.layer.cornerRadius = 15
        sideView.layer.shadowColor = UIColor.black.cgColor
        sideView.layer.shadowOpacity = 0.8
        sideView.layer.shadowOffset = CGSize(width: 5, height:0)
        
        let camera = GMSCameraPosition.camera(withLatitude: 37.787569, longitude: -122.396484, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        view = mapView
        mapView.camera = camera
        mapView.bringSubview(toFront: sideView)
        mapView.bringSubview(toFront: blurView)
        //mapView.bringSubview(toFront: viewConstraint)
        
        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.787569, longitude: -122.396484)
        marker.title = "San Francisco"
        marker.snippet = "California"
        marker.map = mapView
        
        
    }
    @IBAction func panPerformed(_ sender: UIPanGestureRecognizer) {
        
        if sender.state == .began || sender.state == .changed {
            let translation = sender.translation(in: self.view).x
            if translation > 0 { // swipe right
                if viewConstraint.constant < 20 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            } else { // swipe left
                if viewConstraint.constant > -175 {
                    UIView.animate(withDuration: 0.2, animations: {
                        self.viewConstraint.constant += translation / 10
                        self.view.layoutIfNeeded()
                    })
                }
            }
            
        } else if sender.state == .ended {
            
        }
        
    }
    
    
    

}
















