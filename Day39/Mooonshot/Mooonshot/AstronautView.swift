//
//  AstronautView.swift
//  Mooonshot
//
//  Created by Victor Rolando Sanchez Jara on 5/7/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    let missions: [Mission]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack {
                    Image(self.astronaut.id)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometry.size.width)
                    
                    Text(self.astronaut.description)
                        .padding()
                    // Below not needed anymore. This bug was fixed
//                    .layoutPriority(1)
                    Text("Missions")
                        .font(.title)
                    ForEach(self.missions){ mission in
                        Text("Apollo \(mission.id)")
                    }
                }
            }
        }
        .navigationBarTitle(Text(astronaut.name), displayMode: .inline)
    }
    
    init(astronaut: Astronaut, missions: [Mission]) {
        self.astronaut = astronaut
        
        var matches = [Mission]()
        
        for mission in missions {
            for crew in mission.crew {
                if crew.name == astronaut.id {
                    matches.append(mission)
                }
            }
        }
        
        self.missions = matches
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    static let missions: [Mission] = Bundle.main.decode("missions.json")

    static var previews: some View {
        AstronautView(astronaut: astronauts[0], missions: missions)
    }
}
