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
        Group {
            Text("Elevation: \(resort.elevation)m").layoutPriority(1)
            Spacer().frame(height: 0)
            Text("Snow: \(resort.snowDepth)cm").layoutPriority(1)
        }
    }
    // MARK: Methods
}

struct SkiDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SkiDetailsView(resort: Resort.example)
    }
}
