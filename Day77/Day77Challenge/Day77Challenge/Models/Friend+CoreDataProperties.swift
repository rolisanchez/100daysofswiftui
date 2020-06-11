//
//  Friend+CoreDataProperties.swift
//  Day77Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/11/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var name: String
    @NSManaged public var image: UUID

}
