//
//  ManPublishObsObjChanges.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
// Manually publishing ObservableObject changes
struct ManPublishObsObjChanges: View {
    // MARK: Properties
    @ObservedObject var updater = DelayedUpdater()
    

    // MARK: Body
    var body: some View {
        Text("Value is: \(updater.value)")
    }
    // MARK: Methods
}

struct ManPublishObsObjChanges_Previews: PreviewProvider {
    static var previews: some View {
        ManPublishObsObjChanges()
    }
}

// MARK: DelayedUpdater
class DelayedUpdater: ObservableObject {
//    @Published var value = 0
    // If we remove @Published above, changes are not sent automatically
    // If we use below, we need to use objectWillChange to send changes manually.
    // Advantages to send manually is to add extra functionality
    var value = 0 {
        willSet {
            objectWillChange.send()
        }
    }
    
    init() {
        for i in 1...10 {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(i)) {
                self.value += 1
            }
        }
    }
}
