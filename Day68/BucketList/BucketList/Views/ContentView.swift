//
//  ContentView.swift
//  BucketList
//
//  Created by Victor Rolando Sanchez Jara on 6/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    // MARK: Properties
    @State private var isUnlocked = false
    @State private var presentingAlert = false
    
    // MARK: Body
    var body: some View {
        Group {
            if isUnlocked {
                MainAppView()
            } else {
                Button("Unlock Places") {
                    self.authenticate()
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .clipShape(Capsule())
            }
        }
        .alert(isPresented: $presentingAlert) {
            Alert(title: Text("Error during authentication"), message: Text("Please try again"), dismissButton: .default(Text("OK")))
        }
    }
        
    
    // MARK: Methods
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Please authenticate yourself to unlock your places."
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                
                DispatchQueue.main.async {
                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                        print("Error")
                        self.presentingAlert = true
                    }
                }
            }
        } else {
            // no biometrics
            print("No biometrics")
            self.presentingAlert = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


