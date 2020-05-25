//
//  DynamicFilterFetch.swift
//  CoreDataProject
//
//  Created by Victor Rolando Sanchez Jara on 5/23/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct DynamicFilterFetch: View {
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    @State private var ascending = true
    @State private var predicateType: PredicateType = .beginsWith
    var body: some View {
        VStack {
            // list of matching singers
//            FilteredList(filter: lastNameFilter)
            // Without sort descriptors
//            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: []) { (singer: Singer) in
//                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
//            }
            // With sort descriptors
            FilteredList(filterKey: "lastName", filterValue: lastNameFilter, sortDescriptors: [NSSortDescriptor(keyPath: \Singer.firstName, ascending: ascending)], predicateType: predicateType) { (singer: Singer) in
                Text("\(singer.wrappedFirstName) \(singer.wrappedLastName)")
            }
            Button("Add Examples") {
                let taylor = Singer(context: self.moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: self.moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: self.moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? self.moc.save()
            }
            
            TextField("Enter last name for search", text: $lastNameFilter)
            
            Button("Filter A") {
                self.lastNameFilter = "A"
            }
            
            Button("Filter S") {
                self.lastNameFilter = "S"
            }
            Button("Set Begins With") {
                self.predicateType = .beginsWith
            }
            Button("Set Not Begins With") {
                self.predicateType = .notBeginsWith
            }
            Button("Toggle ascending") {
                self.ascending.toggle()
            }
        }
    }
}

struct DynamicFilterFetch_Previews: PreviewProvider {
    static var previews: some View {
        DynamicFilterFetch()
    }
}
