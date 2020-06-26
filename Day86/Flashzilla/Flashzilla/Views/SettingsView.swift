//
//  SettingsView.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/26/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    // MARK: Properties
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var setCardsBack: Bool
    
    // MARK: Body
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game settings")) {
                    Toggle(isOn: $setCardsBack) {
                        VStack(alignment: .leading) {
                            Text("Set wrong cards back into stack")
                        }
                    }
                }
            }
            .navigationBarTitle("Settings")
            .navigationBarItems(leading: Button("Back", action: dismiss))
            .listStyle(GroupedListStyle())
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    // MARK: Methods
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(setCardsBack: .constant(false))
    }
}
