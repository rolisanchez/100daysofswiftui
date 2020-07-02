//
//  SkiDetailsView.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
    // MARK: Properties
    let resort: Resort
    // MARK: Body
    var body: some View {
        VStack {
            Text("Elevation: \(resort.elevation)m")
            Text("Snow: \(resort.snowDepth)cm")
        }
    }
    // MARK: Methods
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
