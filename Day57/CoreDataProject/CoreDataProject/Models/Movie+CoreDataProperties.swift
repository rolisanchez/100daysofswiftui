//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Victor Rolando Sanchez Jara on 5/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String
    @NSManaged public var director: String
    @NSManaged public var year: Int16

    // Title might still be nil because of Core Data's "Faults" ->  we  can create a computed property to avoid problems
    // We ensure value won't be nil and also keep coalescing within the model file, not on the View file
    public var wrappedTitle: String {
        title ?? "Unknown Title"
    }
}
