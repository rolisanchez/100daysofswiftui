//
//  MKPointAnnotation-ObservableObject.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import MapKit

extension MKPointAnnotation: ObservableObject {
    public var wrappedTitle: String {
        get {
            self.title ?? "Unknown value"
        }
        
        set {
            title = newValue
        }
    }
    
    public var wrappedSubtitle: String {
        get {
            self.subtitle ?? "Unknown value"
        }
        
        set {
            subtitle = newValue
        }
    }
}
