//
//  MKPointAnnotation+ExampleExtension.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import MapKit

// Annotation helper for Previews
extension MKPointAnnotation {
    static var example: MKPointAnnotation {
        let annotation = MKPointAnnotation()
        annotation.title = "London"
        annotation.subtitle = "Home to the 2012 Summer Olympics."
        annotation.coordinate = CLLocationCoordinate2D(latitude: 51.5, longitude: -0.13)
        return annotation
    }
}
