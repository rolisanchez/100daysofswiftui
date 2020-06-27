//
//  CustomAligmentDemo.swift
//  LayoutAndGeometry
//
//  Created by Victor Rolando Sanchez Jara on 6/27/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct CustomAligmentDemo: View {
    let example = 2
    var body: some View {
        Group {
            if example == 1 {
                HStack {
                    VStack {
                        Text("@twostraws")
                        Image("example")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                        .clipped()
                    }
                    
                    VStack {
                        Text("Full name:")
                        Text("PAUL HUDSON")
                            .font(.largeTitle)
                    }
                }
            } else if example == 2 {
                HStack(alignment: .midAccountAndName) {
                    VStack {
                        Text("@twostraws")
                            .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                        Image("example")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 64, height: 64)
                            .clipped()
                        Text("Full name:")
                        Text("Full name:")
                        Text("Full name:")
                    }
                    
                    VStack {
                        Text("Full name:")
                        Text("Full name:")
                        Text("Full name:")
                        Text("Full name:")
                        Text("PAUL HUDSON")
                            .alignmentGuide(.midAccountAndName) { d in d[VerticalAlignment.center] }
                            .font(.largeTitle)
                    }
                }
            }
        }
    }
}

struct CustomAligmentDemo_Previews: PreviewProvider {
    static var previews: some View {
        CustomAligmentDemo()
    }
}

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}
