//
//  ValidatingDisablingForms.swift
//  CupcakeCorner
//
//  Created by Victor Rolando Sanchez Jara on 5/14/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ValidatingDisablingForms: View {
    @State private var username = ""
    @State private var email = ""
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Creating account…")
                }
            }
            .disabled(disableForm)

        }
    }
}

struct ValidatingDisablingForms_Previews: PreviewProvider {
    static var previews: some View {
        ValidatingDisablingForms()
    }
}
