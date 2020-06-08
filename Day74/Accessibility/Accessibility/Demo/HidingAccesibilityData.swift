//
//  HidingAccesibilityData.swift
//  Accessibility
//
//  Created by Victor Rolando Sanchez Jara on 6/8/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct HidingAccesibilityData: View {
    // MARK: Properties
    
    // MARK: Body
    var body: some View {
        VStack {
            Image(decorative: "dog")
                .resizable()
                .scaledToFit()
                .accessibility(hidden: true)
            
            Text("Your score is")
            Text("1000")
                .font(.title)
        }
//        .accessibilityElement(children: .combine)
            // Above works, but reads them as separate elements with a pause
            // Below reads them as one element
            .accessibilityElement(children: .ignore)
            .accessibility(label: Text("Your score is 1000"))

        
    }
    
    // MARK: Methods
}

struct HidingAccesibilityData_Previews: PreviewProvider {
    static var previews: some View {
        HidingAccesibilityData()
    }
}
