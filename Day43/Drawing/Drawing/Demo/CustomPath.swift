//
//  CustomPath.swift
//  Drawing
//
//  Created by Victor Rolando Sanchez Jara on 5/9/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CustomPath: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
            // Force join the triangle by adding an additional line
//            path.addLine(to: CGPoint(x: 100, y: 300))

        }
//        .stroke(Color.red.opacity(0.25), lineWidth: 10)
//        .fill(Color.blue)
            // Alternative to join the triangle:
            .stroke(Color.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))


    }
}

struct CustomPath_Previews: PreviewProvider {
    static var previews: some View {
        CustomPath()
    }
}
