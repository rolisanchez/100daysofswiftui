//
//  User+CoreDataProperties.swift
//  Day60Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/26/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: String?
    @NSManaged public var isActive: Bool
    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var company: String?
    @NSManaged public var email: String?
    @NSManaged public var address: String?
    @NSManaged public var about: String?
    @NSManaged public var registered: Date?
    //    @NSManaged public var tags: NSSet?
    @NSManaged public var tags: Set<Tag>
    //    @NSManaged public var friends: NSSet?
    @NSManaged public var friends: Set<Friend>
    
    public var wrappedId: String {
        id ?? "Unknown Id"
    }
    
    public var wrappedName: String {
        name ?? "Unknown name"
    }
    
    public var wrappedCompany: String {
        company ?? "Unknown company"
    }
    
    public var wrappedEmail: String {
        email ?? "Unknown email"
    }
    
    public var wrappedAddress: String {
        address ?? "Unknown address"
    }
    
    public var wrappedAbout: String {
        about ?? "Unknown about"
    }
    
    var tagsString: String {
        let tagsArray = tags.map { $0.name! }
        return tagsArray.joined(separator: ", ")
    }
    
    var formattedRegisteredDate: String {
        ""
    }
    
    public var friendsArray: [Friend] {
        let set = friends as? Set<Friend> ?? []
        return set.sorted {
            $0.name! < $1.name!
        }
    }
}

// MARK: Generated accessors for tags
extension User {

    @objc(addTagsObject:)
    @NSManaged public func addToTags(_ value: Tag)

    @objc(removeTagsObject:)
    @NSManaged public func removeFromTags(_ value: Tag)

    @objc(addTags:)
    @NSManaged public func addToTags(_ values: NSSet)

    @objc(removeTags:)
    @NSManaged public func removeFromTags(_ values: NSSet)

}

// MARK: Generated accessors for friends
extension User {

    @objc(addFriendsObject:)
    @NSManaged public func addToFriends(_ value: Friend)

    @objc(removeFriendsObject:)
    @NSManaged public func removeFromFriends(_ value: Friend)

    @objc(addFriends:)
    @NSManaged public func addToFriends(_ values: NSSet)

    @objc(removeFriends:)
    @NSManaged public func removeFromFriends(_ values: NSSet)

}
