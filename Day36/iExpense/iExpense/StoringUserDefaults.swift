//
//  StoringUserDefaults.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct StoringUserDefaults: View {
    @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    var body: some View {
        Button("Tap count: \(tapCount)") {
            self.tapCount += 1
            UserDefaults.standard.set(self.tapCount, forKey: "Tap")
        }
    }
}

struct StoringUserDefaults_Previews: PreviewProvider {
    static var previews: some View {
        StoringUserDefaults()
    }
}
