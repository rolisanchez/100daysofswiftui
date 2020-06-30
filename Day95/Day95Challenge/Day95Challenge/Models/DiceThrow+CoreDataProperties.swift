//
//  DiceThrow+CoreDataProperties.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/30/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//
//

import Foundation
import CoreData


extension DiceThrow {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DiceThrow> {
        return NSFetchRequest<DiceThrow>(entityName: "DiceThrow")
    }

    @NSManaged public var value: Int16
    @NSManaged public var dateThrown: Date
    @NSManaged public var diceType: String

}
