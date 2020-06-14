//
//  DemoCustomValuesEnvironment.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/14/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

class User: ObservableObject {
    @Published var name = "Taylor Swift"
}

struct EditView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        TextField("Name", text: $user.name)
    }
}

struct DisplayView: View {
    @EnvironmentObject var user: User
    
    var body: some View {
        Text(user.name)
    }
}

struct DemoCustomValuesEnvironment: View {
    let user = User()
    
    var body: some View {
//        VStack {
//            EditView().environmentObject(user)
//            DisplayView().environmentObject(user)
//        }
        // Below also works
        VStack {
            EditView()
            DisplayView()
        }
        .environmentObject(user)
    }
}

struct DemoCustomValuesEnvironment_Previews: PreviewProvider {
    static var previews: some View {
        DemoCustomValuesEnvironment()
    }
}
