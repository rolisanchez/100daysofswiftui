//
//  ContentView.swift
//  Day47Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @ObservedObject var activities = Activities()
    @State private var showingAddActivity = false
    
    // MARK: Body
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<activities.activities.count) { i in
                    NavigationLink(destination: ActivityView(activities: self.activities, index: i)) {
                        VStack(alignment: .leading) {
                            Text(self.activities.activities[i].name)
                                .font(.headline)
                            Text(self.activities.activities[i].description)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationBarTitle("Habit Tracker")
            .navigationBarItems(trailing: Button(action: {
                self.showingAddActivity = true
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showingAddActivity) {
                AddView(activities: self.activities)
            }
        }
    }
    // MARK: Methods
    func removeItems(at offsets: IndexSet) {
        activities.activities.remove(atOffsets: offsets)
        // MARK: TODO: Delete after Xcode 11.5 fixes this bug below
        activities.activities = activities.activities
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
