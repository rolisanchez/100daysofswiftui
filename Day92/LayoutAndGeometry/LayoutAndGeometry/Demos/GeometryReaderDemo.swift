//
//  GeometryReaderDemo.swift
//  LayoutAndGeometry
//
//  Created by Victor Rolando Sanchez Jara on 6/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct GeometryReaderDemo: View {
    var body: some View {
        // Example 1
//                GeometryReader { geo in
//                    Text("Hello, World!")
//                        .frame(width: geo.size.width * 0.9)
//                        .background(Color.red)
//                }
        // Example 2: GeometryReader taking space
//        VStack {
//            GeometryReader { geo in
//                Text("Hello, World!")
//                    .frame(width: geo.size.width * 0.9, height: 40)
//                    .background(Color.red)
//            }
//            .background(Color.green)
//            Text("More text")
//                .background(Color.blue)
//        }
        
        // Example 3: Custom Coordinate Space
        OuterView()
            .background(Color.red)
            .coordinateSpace(name: "Custom")
    }
}

struct GeometryReaderDemo_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderDemo()
    }
}


struct OuterView: View {
    var body: some View {
        VStack {
            Text("Top")
            InnerView()
                .background(Color.green)
            Text("Bottom")
        }
    }
}

struct InnerView: View {
    var body: some View {
        HStack {
            Text("Left")
            GeometryReader { geo in
                Text("Center")
                    .background(Color.blue)
                    .onTapGesture {
                        print("Global center: \(geo.frame(in: .global).midX) x \(geo.frame(in: .global).midY)")
                        print("Custom center: \(geo.frame(in: .named("Custom")).midX) x \(geo.frame(in: .named("Custom")).midY)")
                        print("Local center: \(geo.frame(in: .local).midX) x \(geo.frame(in: .local).midY)")
                }
            }
            .background(Color.orange)
            Text("Right")
        }
    }
}
