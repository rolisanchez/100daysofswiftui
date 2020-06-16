//
//  SwiftPackManDemo.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/16/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import SamplePackage

struct SwiftPackManDemo: View {
    let possibleNumbers = Array(1...60)
    var results: String {
        let selected = possibleNumbers.random(7).sorted()
        let strings = selected.map(String.init)
        return strings.joined(separator: ", ")
    }
    
    var body: some View {
        Text(results)
    }
}

struct SwiftPackManDemo_Previews: PreviewProvider {
    static var previews: some View {
        SwiftPackManDemo()
    }
}
