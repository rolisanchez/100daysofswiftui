//
//  ResortDetailsView.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {
    // MARK: Properties
    let resort: Resort
    
    var size: String {
        switch resort.size {
            case 1:
                return "Small"
            case 2:
                return "Average"
            default:
                return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
    }
    
    // MARK: Body
    var body: some View {
        VStack {
            Text("Size: \(size)")
            Text("Price: \(price)")
        }
    }
    // MARK: Methods
}

struct ResortDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        ResortDetailsView(resort: Resort.example)
    }
}
