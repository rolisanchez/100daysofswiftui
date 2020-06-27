//
//  AlignmentDemo.swift
//  LayoutAndGeometry
//
//  Created by Victor Rolando Sanchez Jara on 6/27/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AlignmentDemo: View {
    let example = 4
    var body: some View {
        Group {
            if example == 1 {
                // Example 1:
                Text("Live long and prosper")
                    .frame(width: 300, height: 300)
                    .frame(width: 300, height: 300, alignment: .topLeading)
            } else if example == 2 {
                // Example 2:
                HStack(alignment: .lastTextBaseline) {
                    //        HStack(alignment: .bottom) {
                    //        HStack {
                    Text("Live")
                        .font(.caption)
                    Text("long")
                    Text("and")
                        .font(.title)
                    Text("prosper")
                        .font(.largeTitle)
                }
            } else if example == 3 {
                VStack(alignment: .leading) {
                    Text("Hello, world!")
//                        .alignmentGuide(.leading) { d in d[.leading] }
                        .alignmentGuide(.leading) { d in d[.trailing] }


                    Text("This is a longer line of text")
                }
                .background(Color.red)
                .frame(width: 400, height: 400)
                .background(Color.blue)
            } else if example == 4 {
                VStack(alignment: .leading) {
                    ForEach(0..<10) { position in
                        Text("Number \(position)")
                            .alignmentGuide(.leading) { _ in CGFloat(position) * -10 }
                    }
                }
                .background(Color.red)
                .frame(width: 400, height: 400)
                .background(Color.blue)
            }
        }


    }
}

struct AlignmentDemo_Previews: PreviewProvider {
    static var previews: some View {
        AlignmentDemo()
    }
}
