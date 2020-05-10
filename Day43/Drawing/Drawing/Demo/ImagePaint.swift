//
//  ImagePaintDemo.swift
//  Drawing
//
//  Created by Victor Rolando Sanchez Jara on 5/10/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ImagePaintDemo: View {
    var body: some View {
        // Text with color background
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .background(Color.red)
        
        // Text with red border
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(Color.red, width: 30)
        
        //Image background
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .background(Image("Example"))
        
        // Image as border doesn't work
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(Image("Example"), width: 30)

        // Image Paint
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("Example"), scale: 0.2), width: 50)
        
        // Image Paint and Source Rect
//        Text("Hello World")
//            .frame(width: 300, height: 300)
//            .border(ImagePaint(image: Image("Example"), sourceRect: CGRect(x: 0, y: 0.25, width: 1, height: 0.5), scale: 0.1), width: 30)
        
        // Image paint with Capsule
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.1), lineWidth: 30)
            .frame(width: 300, height: 200)
        
    }
}

struct ImagePaintDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImagePaintDemo()
    }
}
