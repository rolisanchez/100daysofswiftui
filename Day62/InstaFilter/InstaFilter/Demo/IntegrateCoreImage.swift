//
//  IntegrateCoreImage.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/28/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct IntegrateCoreImage: View {
    // MARK: Properties
    @State private var image: Image?
    
    // MARK: Body
    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }
    
    // MARK: Methods
    func loadImage() {
        guard let inputImage = UIImage(named: "Example") else { return }
        let beginImage = CIImage(image: inputImage)
        
        let context = CIContext()
        
        // Sepia Filter
        //        let currentFilter = CIFilter.sepiaTone()
        //        currentFilter.inputImage = beginImage
        //        currentFilter.intensity = 1
        
        // Pixellate Filter
        //        let currentFilter = CIFilter.pixellate()
        //        currentFilter.inputImage = beginImage
        //        currentFilter.scale = 100
        
        //        let currentFilter = CIFilter.crystallize()
        // Bug with Crystallize
        //        currentFilter.inputImage = beginImage
        // Above doesn't work. Might get fixed in the future
        // This below should work but isn't working ON SIMULATOR - works on phone:
        //        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        //        currentFilter.radius = 200
        
        
        // Twirl
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        
        // get a CIImage from our filter or exit if that fails
        guard let outputImage = currentFilter.outputImage else {
            return
        }
        
        // attempt to get a CGImage from our CIImage
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            // convert that to a UIImage
            let uiImage = UIImage(cgImage: cgimg)
            
            // and convert that to a SwiftUI image
            image = Image(uiImage: uiImage)
        }
        // more code to come
    }
}

struct IntegrateCoreImage_Previews: PreviewProvider {
    static var previews: some View {
        IntegrateCoreImage()
    }
}
