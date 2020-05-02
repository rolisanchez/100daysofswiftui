//
//  ShowingHidingViews.swift
//  iExpense
//
//  Created by Victor Rolando Sanchez Jara on 5/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ShowingHidingViews: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            self.showingSheet.toggle()
        }.sheet(isPresented: $showingSheet) {
            SecondView(name: "Essun")
        }
    }
}

struct ShowingHidingViews_Previews: PreviewProvider {
    static var previews: some View {
        ShowingHidingViews()
    }
}



struct SecondView: View {
    var name: String
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Hello, \(name)!")
            Button("Dismiss") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
