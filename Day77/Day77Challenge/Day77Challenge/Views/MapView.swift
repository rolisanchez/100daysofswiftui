//
//  MapView.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import MapKit

struct MapView: UIViewRepresentable {
    //    typealias UIViewType = MKMapView
    // MARK: Properties
    
    let centerCoordinate: CLLocationCoordinate2D
    let selectedPlace: MKPointAnnotation?
    
    var annotations: [MKPointAnnotation]
    
    // MARK: Make and Update
    func makeUIView(context: UIViewRepresentableContext<MapView>) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        
        if let place = selectedPlace {
            print("Place")
            let region = MKCoordinateRegion(center: place.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            mapView.setRegion(region, animated: true)
        } else {
            print("Else")
        }

        return mapView
    }
    
    func updateUIView(_ view: MKMapView, context: UIViewRepresentableContext<MapView>) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        print("annotations \(annotations)")
        print("annotations count \(annotations.count)")
        if let place = selectedPlace {
            print("Place")
            let region = MKCoordinateRegion(center: place.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
            view.setRegion(region, animated: true)
        } else {
            print("Else")
        }
    }
    
    // MARK: Coordinator
    class Coordinator: NSObject, MKMapViewDelegate {
        var parent: MapView
        
        init(_ parent: MapView) {
            self.parent = parent
        }
        
//        func mapViewDidChangeVisibleRegion(_ mapView: MKMapView) {
//            parent.centerCoordinate = mapView.centerCoordinate
//        }
        
        func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
            // this is our unique identifier for view reuse
            let identifier = "Placemark"
            
            // attempt to find a cell we can recycle
            var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            
            if annotationView == nil {
                // we didn't find one; make a new one
                annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
                
                // allow this to show pop up information
                annotationView?.canShowCallout = true
                
                // attach an information button to the view
                annotationView?.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            } else {
                // we have a view to reuse, so give it the new annotation
                annotationView?.annotation = annotation
            }
            
            // whether it's a new view or a recycled one, send it back
            return annotationView
        }
        
//        func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//            guard let placemark = view.annotation as? MKPointAnnotation else { return }
            
//            parent.selectedPlace = placemark
//            parent.showingPlaceDetails = true
//        }
        
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(centerCoordinate: MKPointAnnotation.example.coordinate, selectedPlace: MKPointAnnotation.example, annotations: [MKPointAnnotation.example])
        
    }
}
