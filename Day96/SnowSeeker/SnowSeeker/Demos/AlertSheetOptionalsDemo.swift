//
//  AlertSheetOptionalsDemo.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AlertSheetOptionalsDemo: View {
    @State private var selectedUser: User? = nil

    var body: some View {
        Text("Hello, World!")
            .onTapGesture {
                self.selectedUser = User()
        }
        .alert(item: $selectedUser) { user in
            Alert(title: Text(user.id))
        }
    }
}

struct AlertSheetOptionalsDemo_Previews: PreviewProvider {
    static var previews: some View {
        AlertSheetOptionalsDemo()
    }
}

struct User: Identifiable {
    var id = "Taylor Swift"
}
