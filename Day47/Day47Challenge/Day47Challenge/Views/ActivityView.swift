//
//  ActivityView.swift
//  Day47Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
// how many times they have completed it, plus a button incrementing their completion count.
struct ActivityView: View {
    @ObservedObject var activities: Activities
    var index: Int
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Name: \(activities.activities[index].name)")
                .font(.headline)
            Text("Description: \(activities.activities[index].description)")
            Text("Times done: \(activities.activities[index].count)")
            Button(action: {
                self.activities.activities[self.index].count += 1
                // MARK: TODO: Delete after Xcode 11.5 fixes this bug below
                self.activities.activities = self.activities.activities
            }) {
                Text("Increment")
            }
        }
    }
}

struct ActivityView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityView(activities: Activities(), index: 0)
    }
}
