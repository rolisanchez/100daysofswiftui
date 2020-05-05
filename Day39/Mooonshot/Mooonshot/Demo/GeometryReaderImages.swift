//
//  GeometryReaderImages.swift
//  Mooonshot
//
//  Created by Victor Rolando Sanchez Jara on 5/5/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct GeometryReaderImages: View {
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image("Example")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    //                .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width)
                //                .clipped()
                
            }
        }
    }
}

struct GeometryReaderImages_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderImages()
    }
}
