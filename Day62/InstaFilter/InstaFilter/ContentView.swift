//
//  ContentView.swift
//  InstaFilter
//
//  Created by Victor Rolando Sanchez Jara on 5/27/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

struct ContentView: View {
    // MARK: Properties
    // Image selection
    @State private var image: Image?
    @State private var filterIntensity = 0.5
    @State private var filterRadius = 0.5

    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    // Filters
//    @State private var currentFilter = CIFilter.sepiaTone()
    @State private var currentFilter: CIFilter = CIFilter.sepiaTone()
    let context = CIContext()
    @State private var showingFilterSheet = false
    @State private var processedImage: UIImage?
    @State private var showingAlert = false

    @State private var filterButtonTitle = "Sepia Filter (Tap to Change)"
    // MARK: Body
    var body: some View {
        let intensity = Binding<Double>(
                get: {
                    self.filterIntensity
            },
                set: {
                    self.filterIntensity = $0
                    self.applyProcessing()
            }
        )
    
        let radius = Binding<Double>(
            get: {
                self.filterRadius
        },
            set: {
                self.filterRadius = $0
                self.applyProcessing()
        }
        )
        return NavigationView {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
                HStack {
                    Text("Intensity")
                    Slider(value: intensity)
                }.padding(.vertical)
                
                if currentFilter.inputKeys.contains(kCIInputRadiusKey) {
                    HStack {
                        Text("Radius")
                        Slider(value: radius)
                    }.padding(.vertical)
                }
                HStack {
                    Button(filterButtonTitle) {
                        self.showingFilterSheet = true
                    }
                    
                    Spacer()
                    
                    Button("Save") {
                        guard let processedImage = self.processedImage else {
                            self.showingAlert = true
                            return
                            
                        }
                        
                        // Without error/success handler
//                        let imageSaver = ImageSaver()
//                        imageSaver.writeToPhotoAlbum(image: processedImage)
                        
                        // With error/success handler
                        let imageSaver = ImageSaver()
                        
                        imageSaver.successHandler = {
                            print("Success!")
                        }
                        
                        imageSaver.errorHandler = {
                            print("Oops: \($0.localizedDescription)")
                        }
                        
                        imageSaver.writeToPhotoAlbum(image: processedImage)
                    }
                }
            }
            .padding([.horizontal, .bottom])
            .navigationBarTitle("Instafilter")
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
            .actionSheet(isPresented: $showingFilterSheet) {
                ActionSheet(title: Text("Change filter"), buttons: [
                    .default(Text("Crystallize")) {
                        self.filterButtonTitle = "Crystallize Filter (Tap to Change)"
                        self.setFilter(CIFilter.crystallize())
                    },
                    .default(Text("Edges")) {
                        self.filterButtonTitle = "Edges Filter (Tap to Change)"
                        self.setFilter(CIFilter.edges())
                    },
                    .default(Text("Gaussian Blur")) {
                        self.filterButtonTitle = "Gaussian Blur (Tap to Change)"
                        self.setFilter(CIFilter.gaussianBlur())
                    },
                    .default(Text("Pixellate")) {
                        self.filterButtonTitle = "Pixellate Filter (Tap to Change)"
                        self.setFilter(CIFilter.pixellate())
                    },
                    .default(Text("Sepia Tone")) {
                        self.filterButtonTitle = "Sepia Filter (Tap to Change)"
                        self.setFilter(CIFilter.sepiaTone())
                        
                    },
                    .default(Text("Unsharp Mask")) {
                        self.filterButtonTitle = "Unsharp Filter (Tap to Change)"
                        self.setFilter(CIFilter.unsharpMask())
                    },
                    .default(Text("Vignette")) { self.setFilter(CIFilter.vignette()) },
                    .cancel()
                ])
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text("Please choose an image"), dismissButton: .default(Text("Ok")))
            }

            
//            Experiment with having more than one slider, to control each of the input keys you care about. For example, you might have one for radius and one for intensity.
        }
    }
    
    // MARK: Methods
    func loadImage() {
        guard let inputImage = inputImage else { return }
        // Image without filter
//        image = Image(uiImage: inputImage)
        
        // Image with filter
//        let beginImage = CIImage(image: inputImage)
        // Keep orientation
        let beginImage = CIImage(image: inputImage, options: [CIImageOption.applyOrientationProperty:true])

        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        applyProcessing()
    }
    
    func applyProcessing() {
        // This below doesn't work anymore after declaring currentFilter: CIFilter
//        currentFilter.intensity = Float(filterIntensity)
        // Bewlo only for for Sepia
//        currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey)
        let inputKeys = currentFilter.inputKeys
        if inputKeys.contains(kCIInputIntensityKey) {
            print("kCIInputIntensityKey")
            currentFilter.setValue(filterIntensity, forKey: kCIInputIntensityKey) }
        if inputKeys.contains(kCIInputRadiusKey) {
            print("kCIInputRadiusKey")
            currentFilter.setValue(filterRadius * 200, forKey: kCIInputRadiusKey) }
        if inputKeys.contains(kCIInputScaleKey) {
            print("kCIInputScaleKey")
            currentFilter.setValue(filterIntensity * 10, forKey: kCIInputScaleKey) }

        guard let outputImage = currentFilter.outputImage else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
//            let uiImage = UIImage(cgImage: cgimg)
            // Keep orientation
            let uiImage = UIImage(cgImage: cgimg, scale: 1, orientation: inputImage?.imageOrientation ?? .up)

            image = Image(uiImage: uiImage)
            processedImage = uiImage

        }
    }
    
    func setFilter(_ filter: CIFilter) {
        currentFilter = filter
        loadImage()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


class ImageSaver: NSObject {
    var successHandler: (() -> Void)?
    var errorHandler: ((Error) -> Void)?
    
    func writeToPhotoAlbum(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, self, #selector(saveError), nil)
    }
    
    @objc func saveError(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        print("Save finished!")
        if let error = error {
            errorHandler?(error)
        } else {
            successHandler?()
        }
    }
}
