//
//  BackgroundNotificationDemo.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/22/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct BackgroundNotificationDemo: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
                print("Moving to the background!")
            }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            print("Moving back to the foreground!")
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.userDidTakeScreenshotNotification)) { _ in
            print("User took a screenshot!")
        }
    }
}

struct BackgroundNotificationDemo_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundNotificationDemo()
    }
}
