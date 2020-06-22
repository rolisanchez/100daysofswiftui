//
//  TimerDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct TimerDemo: View {
    // MARK: Properties
    // Without tolerance
//    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    // With tolerance
    let timer = Timer.publish(every: 1, tolerance: 0.5, on: .main, in: .common).autoconnect()

    @State private var counter = 0

    // MARK: Body
    var body: some View {
        Text("Counter: \(counter)")
            .onReceive(timer) { time in
                if self.counter == 5 {
                    self.timer.upstream.connect().cancel()
                } else {
                    print("The time is now \(time)")
                }
                
                self.counter += 1
        }
    }
    
    // MARK: Methods
}

struct TimerDemo_Previews: PreviewProvider {
    static var previews: some View {
        TimerDemo()
    }
}
