//
//  MissionView.swift
//  Mooonshot
//
//  Created by Victor Rolando Sanchez Jara on 5/7/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    
    let missions: [Mission]
    
    let astronauts: [CrewMember]

    var body: some View {
        GeometryReader { geometry in
            ScrollView(.vertical) {
                VStack(alignment: .center) {
                    GeometryReader { geo in
                        Image(self.mission.image)
                            .resizable()
                            .scaledToFit()
                            .frame(maxWidth: geometry.size.width * ((geo.frame(in: .global).maxY-200)/100))
                            .padding(.top)
                            .accessibility(label: Text("Insignia for \(self.mission.displayName)"))
                        .position(x: geo.frame(in: .local).midX, y: geo.frame(in: .local).midY)
                    }
                    Text(self.mission.formattedLaunchDate)
                        .font(.headline)
                    Text(self.mission.description)
                        .padding()
                    
                    Spacer(minLength: 25)
                    
                    ForEach(self.astronauts, id: \.role) { crewMember in
                        NavigationLink(destination: AstronautView(astronaut: crewMember.astronaut, missions: self.missions)) {
                            HStack {
                                
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 83, height: 60)
                                .clipShape(Capsule())
                                .overlay(Capsule().stroke(Color.primary, lineWidth: 1))
                                .accessibility(hidden: true)
                                
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .font(.headline)
                                    Text(crewMember.role)
                                        .foregroundColor(.secondary)
                                }
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())

                    }
                }
            }
        }
        .navigationBarTitle(Text(mission.displayName), displayMode: .inline)
        
        
    }
    
    init(mission: Mission, missions: [Mission], astronauts: [Astronaut]) {
        self.mission = mission
        self.missions = missions
        var matches = [CrewMember]()
        
        for member in mission.crew {
            if let match = astronauts.first(where: { $0.id == member.name }) {
                matches.append(CrewMember(role: member.role, astronaut: match))
            } else {
                fatalError("Missing \(member)")
            }
        }
        
        self.astronauts = matches
    }
}

struct MissionView_Previews: PreviewProvider {
    static let missions: [Mission] = Bundle.main.decode("missions.json")
    static let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")

    static var previews: some View {
        MissionView(mission: missions[0], missions: missions, astronauts: astronauts)
    }
}
