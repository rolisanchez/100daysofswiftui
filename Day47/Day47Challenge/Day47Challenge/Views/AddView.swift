//
//  AddView.swift
//  Day47Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/12/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AddView: View {
    // MARK: Properties
    @ObservedObject var activities: Activities
    
    @State private var name = ""
    @State private var description = ""
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @Environment(\.presentationMode) var presentationMode

    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            }
            .navigationBarTitle("Add new activity")
            .navigationBarItems(trailing: Button("Save") {
                if self.name.isEmpty || self.description.isEmpty {
                    self.alertTitle = "Error saving activity"
                    self.alertMessage = "Please enter valid name & description"
                    self.showingAlert.toggle()
                } else {
                    let activity = Activity(name: self.name, description: self.description, count: 0)
                    self.activities.activities.append(activity)
                    // MARK: TODO: Delete after Xcode 11.5 fixes this bug below
                    self.activities.activities = self.activities.activities
                    self.presentationMode.wrappedValue.dismiss()
                }
                
            })
            .alert(isPresented: $showingAlert) {
                Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")){
                    })
            }
        }
    }
    // MARK: Methods
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(activities: Activities())
    }
}
