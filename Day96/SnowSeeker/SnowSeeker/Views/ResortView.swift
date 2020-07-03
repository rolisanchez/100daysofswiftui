//
//  ResortView.swift
//  SnowSeeker
//
//  Created by Victor Rolando Sanchez Jara on 7/2/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ResortView: View {
    // MARK: Properties
    @Environment(\.horizontalSizeClass) var sizeClass
    @EnvironmentObject var favorites: Favorites

    let resort: Resort
    
    @State private var selectedFacility: Facility?
    
    // MARK: Body
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                Image(decorative: resort.id)
                    .resizable()
                    .scaledToFit()
                
                Group {
                    // Without checking size classes
//                    HStack {
//                        Spacer()
//                        ResortDetailsView(resort: resort)
//                        SkiDetailsView(resort: resort)
//                        Spacer()
//                    }
//                    .font(.headline)
//                    .foregroundColor(.secondary)
//                    .padding(.top)
                    
                    // With checking size classes
                    HStack {
                        if sizeClass == .compact {
                            Spacer()
                            VStack { ResortDetailsView(resort: resort) }
                            VStack { SkiDetailsView(resort: resort) }
                            Spacer()
                        } else {
                            ResortDetailsView(resort: resort)
                            Spacer().frame(height: 0)
                            SkiDetailsView(resort: resort)
                        }
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)
                    

                    
                    Text(resort.description)
                        .padding(.vertical)
                    
                    Text("Facilities")
                        .font(.headline)
                    
                    
//                    Text(resort.facilities.joined(separator: ", "))
//                        .padding(.vertical)
                    // Below is better than above because uses "and" on the last item
//                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
//                        .padding(.vertical)
                    
                    // Using icons
//                    HStack {
//                        ForEach(resort.facilities, id: \.self) { facility in
//                            Facility.icon(for: facility)
//                                .font(.title)
//                                .onTapGesture {
//                                    self.selectedFacility = facility
//                                }
//                        }
//                    }
//                    .padding(.vertical)
                    
                    // Using icons and Facility Types
                    HStack {
                        ForEach(resort.facilityTypes) { facility in
                            facility.icon
                                .font(.title)
                                .onTapGesture {
                                    self.selectedFacility = facility
                            }
                        }
                    }
                    .padding(.vertical)
                }
                .padding(.horizontal)
            }
            
            Button(favorites.contains(resort) ? "Remove from Favorites" : "Add to Favorites") {
                if self.favorites.contains(self.resort) {
                    self.favorites.remove(self.resort)
                } else {
                    self.favorites.add(self.resort)
                }
            }
            .padding()

        }
        .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
        .alert(item: $selectedFacility) { facility in
            facility.alert
        }

    }
    // MARK: Methods
}

struct ResortView_Previews: PreviewProvider {
    static var previews: some View {
        ResortView(resort: Resort.example)
    }
}


