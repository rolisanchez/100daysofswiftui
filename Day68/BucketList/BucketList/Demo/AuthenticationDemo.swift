//
//  AuthenticationDemo.swift
//  BucketList
//
//  Created by Victor Rolando Sanchez Jara on 6/4/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct AuthenticationDemo: View {
    // MARK: Properties
    @State private var isUnlocked = false
    
    // MARK: Body
    var body: some View {
        
        VStack {
            if self.isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    // MARK: Methods
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        // check whether biometric authentication is possible
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            // it's possible, so go ahead and use it
            let reason = "We need to unlock your data!!"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                // authentication has now completed
                DispatchQueue.main.async {
                    if success {
                        // authenticated successfully
                        self.isUnlocked = true
                    } else {
                        // there was a problem
                    }
                }
            }
        } else {
            // no biometrics
        }
    }
}

struct AuthenticationDemo_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticationDemo()
    }
}
