//
//  DiceView.swift
//  Day95Challenge
//
//  Created by Victor Rolando Sanchez Jara on 6/29/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI
import CoreData

struct DiceView: View {
    // MARK: Properties
    @EnvironmentObject var settings: AppSettings
    @Environment(\.managedObjectContext) var moc
    
    @State private var degrees: Double = 0
    @State private var diceText = "?"
    
    @State private var rotateX: CGFloat = 0
    @State private var rotateY: CGFloat = 0
    @State private var rotateZ: CGFloat = 0
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var diceThrowsRequest: FetchRequest<DiceThrow>
    var diceThrows: FetchedResults<DiceThrow> { diceThrowsRequest.wrappedValue }
    init(){
        let request: NSFetchRequest<DiceThrow> = DiceThrow.fetchRequest()
        request.fetchLimit = 3
        let sortDescriptors = [NSSortDescriptor(keyPath: \DiceThrow.dateThrown, ascending: false)]
        request.sortDescriptors = sortDescriptors
        diceThrowsRequest = FetchRequest<DiceThrow>(fetchRequest: request)
    }
    
    // MARK: Body
    var body: some View {
        NavigationView {
            VStack(spacing: 24) {
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .cornerRadius(5)
                        .shadow(radius: 6, x: 0, y: 3)
                        .frame(width: 200, height: 200)
                    Text(diceText)
                        .foregroundColor(.purple)
                        .font(.custom("SF Pro Text", size: 56))
                        .fontWeight(.bold)
                        .frame(width: 180, height: 180)
                }
                .rotation3DEffect(.degrees(degrees), axis: (x: rotateX, y: rotateY, z: rotateZ))
                
                Button(action: rollDice, label: {
                    Text("Roll the dice")
                        .padding()
                        .foregroundColor(.white)
                        .frame(width: 130, height: 44)
                        .background(Color.purple)
                        .cornerRadius(5)
                        .shadow(radius: 6, x: 0, y: 3)
                })
                
                Text("Last values thrown:")
                ForEach(diceThrows, id: \.self) { diceThrow in
                    HStack {
                        Text("Dice Type: \(diceThrow.diceType)")
                        Text("~ Value: \(diceThrow.value)")
                    }
                    
                }
            }
            .navigationBarTitle("Dice Roll")
        }
        
    }
    // MARK: Methods
    func rollDice() {
        self.feedback.prepare()
        
        withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
            self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
            rotateX = 1
            rotateY = 1
            degrees += 360
            self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
            self.feedback.notificationOccurred(.success)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
            withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
                self.rotateX = 0
                self.rotateY = 1
                self.rotateZ = 1
                self.degrees += 360
                self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
                self.feedback.notificationOccurred(.success)
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now()+2, execute: {
                withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                    self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
                    self.rotateY = 0
                    self.rotateZ = 1
                    self.rotateX = 1
                    self.degrees += 360
                    self.diceText = "\(Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!))"
                    self.feedback.notificationOccurred(.success)
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now()+3, execute: {
                    withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                        // Last rolled number
                        let diceValue = Int.random(in: 1..<DiceLimits[DiceType(rawValue: self.settings.chosenDice)!]!)
                        self.diceText = "\(diceValue)"
                        self.feedback.notificationOccurred(.success)
                        
                        let createThrow = DiceThrow(context: self.moc)
                        createThrow.value = Int16(diceValue)
                        createThrow.diceType = DiceType(rawValue: self.settings.chosenDice)!.rawValue
                        createThrow.dateThrown = Date()
                        try? self.moc.save()
                    }
                })
            })
        })
        
        
    }
}

struct DiceView_Previews: PreviewProvider {
    static var previews: some View {
        DiceView()
    }
}
