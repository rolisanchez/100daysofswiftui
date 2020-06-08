//
//  ReadingValueControls.swift
//  Accessibility
//
//  Created by Victor Rolando Sanchez Jara on 6/8/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ReadingValueControls: View {
    // MARK: Properties
    @State private var estimate = 25.0
    @State private var rating = 3

    // MARK: Body
    var body: some View {
        VStack {
            Slider(value: $estimate, in: 0...50)
                .padding()
                .accessibility(value: Text("\(Int(estimate))"))
            
            Stepper("Rate our service: \(rating)/5", value: $rating, in: 1...5)
                .accessibility(value: Text("\(rating) out of 5"))


        }

    }
    // MARK: Methods
}

struct ReadingValueControls_Previews: PreviewProvider {
    static var previews: some View {
        ReadingValueControls()
    }
}
