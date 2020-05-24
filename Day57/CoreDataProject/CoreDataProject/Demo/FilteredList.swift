//
//  FilteredList.swift
//  CoreDataProject
//
//  Created by Victor Rolando Sanchez Jara on 5/23/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreData

//struct FilteredList: View {
struct OldFilteredList<T: NSManagedObject, Content: View>: View {
    // Using Singer Class
    var fetchRequest: FetchRequest<Singer>
    var singers: FetchedResults<Singer> { fetchRequest.wrappedValue }

    init(filter: String) {
        fetchRequest = FetchRequest<Singer>(entity: Singer.entity(), sortDescriptors: [], predicate: NSPredicate(format: "lastName BEGINSWITH %@", filter))
    }
    
    var body: some View {
        List(fetchRequest.wrappedValue, id: \.self) { singer in
            Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
        }
    }
}

// Improved to use Generics
struct GenericsFilteredList<T: NSManagedObject, Content: View>: View {
    // Generics
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    init(filterKey: String, filterValue: String, @ViewBuilder content: @escaping (T) -> Content) {
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: [], predicate: NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue))
        self.content = content
    }
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer)
        }
    }
}

// Improved Challenge
struct FilteredList<T: NSManagedObject, Content: View>: View {
    // Generics
    var fetchRequest: FetchRequest<T>
    var singers: FetchedResults<T> { fetchRequest.wrappedValue }
//    var sortDescriptors: [NSSortDescriptor]
    
    // this is our content closure; we'll call this once for each item in the list
    let content: (T) -> Content
    
    init(filterKey: String, filterValue: String, sortDescriptors: [NSSortDescriptor], predicateType: PredicateType, @ViewBuilder content: @escaping (T) -> Content) {
        var predicate: NSPredicate?
        switch predicateType {
            case .beginsWith:
                predicate = NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
            case .notBeginsWith:
                predicate = NSPredicate(format: "NOT %K BEGINSWITH %@", filterKey, filterValue)
            default:
                predicate = nil
        }
        // NSPredicate(format: "%K BEGINSWITH %@", filterKey, filterValue)
        fetchRequest = FetchRequest<T>(entity: T.entity(), sortDescriptors: sortDescriptors, predicate: predicate)
        self.content = content
    }
    
    var body: some View {
        List(singers, id: \.self) { singer in
            self.content(singer)
        }
    }
}

enum PredicateType {
    case beginsWith, notBeginsWith, equals, lessthan, greaterThan, valueIn
}
