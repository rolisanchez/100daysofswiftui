//
//  ContentView.swift
//  Mooonshot
//
//  Created by Victor Rolando Sanchez Jara on 5/5/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
//    let astronauts = Bundle.main.decode("astronauts.json")
    // Using Generics we need to pass exactly what type T is, so we use type annotation
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    // Using generics with same Bundle extension
    let missions: [Mission] = Bundle.main.decode("missions.json")

    @State private var showingCrewNames = false
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination:  MissionView(mission: mission, missions: self.missions, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
//                        .aspectRatio(contentMode: .fit)
                        // Same as above:
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                        .accessibility(hidden: true)
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        if self.showingCrewNames {
                            Text(mission.formattedCrew)
                        } else {
                            Text(mission.formattedLaunchDate)
                        }
                        
                    }
                }
            }
            .navigationBarTitle("Moonshot")
            .navigationBarItems(leading: Button(action: {
                self.showingCrewNames.toggle()
            }, label: {
                Text("Show \(showingCrewNames ? "dates" : "crew")")
            }))
        }

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
