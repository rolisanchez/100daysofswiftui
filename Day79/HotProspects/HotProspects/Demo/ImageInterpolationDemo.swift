//
//  ImageInterpolationDemo.swift
//  HotProspects
//
//  Created by Victor Rolando Sanchez Jara on 6/15/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ImageInterpolationDemo: View {
    var body: some View {
        VStack {
            Image("example")
                .interpolation(.none)
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
            Image("example")
                .resizable()
                .scaledToFit()
                .frame(maxHeight: .infinity)
                .background(Color.black)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct ImageInterpolationDemo_Previews: PreviewProvider {
    static var previews: some View {
        ImageInterpolationDemo()
    }
}
