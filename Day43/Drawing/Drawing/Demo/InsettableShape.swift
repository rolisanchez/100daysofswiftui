//
//  InsettableShapeDemo.swift
//  Drawing
//
//  Created by Victor Rolando Sanchez Jara on 5/9/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct InsettableShapeDemo: View {
    var body: some View {
//        Circle()
            // Circle is drawn outside the view
//            .stroke(Color.blue, lineWidth: 40)
            // Keeps the circle inside the view:
//            .strokeBorder(Color.blue, lineWidth: 40)
        // Keeping cirlce inside the view using insettable shape
        Arc(startAngle: .degrees(-90), endAngle: .degrees(90), clockwise: true)
            .strokeBorder(Color.blue, lineWidth: 40)

    }
}

struct InsettableShapeDemo_Previews: PreviewProvider {
    static var previews: some View {
        InsettableShapeDemo()
    }
}


struct Arc: InsettableShape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool
    var insetAmount: CGFloat = 0

    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        let modifiedStart = startAngle - rotationAdjustment
        let modifiedEnd = endAngle - rotationAdjustment
        
        var path = Path()
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY), radius: rect.width / 2 - insetAmount, startAngle: modifiedStart, endAngle: modifiedEnd, clockwise: !clockwise)

        
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        arc.insetAmount += amount
        return arc
    }
}
