//
//  ContentView.swift
//  Flashzilla
//
//  Created by Victor Rolando Sanchez Jara on 6/21/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWithoutColor
    @Environment(\.accessibilityEnabled) var accessibilityEnabled

//    @State private var cards = [Card](repeating: Card.example, count: 10)
    @State private var cards = [Card]()

    @State private var timeRemaining = 100
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    @State private var isActive = true

    @State private var showingEditScreen = false

    @State private var feedback = UINotificationFeedbackGenerator()
    
    @State private var editing = true
    
    @State private var setCardsBack = true
    
    // MARK: Body
    var body: some View {
        ZStack {
            Image(decorative: "background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack {
                Group {
                    Text("Time: ")
                        .font(.largeTitle)
                        .foregroundColor(.white)
                        +
                        Text("\(timeRemaining)")
                            .font(.largeTitle)
                            .foregroundColor(timeRemaining <= 10 && !differentiateWithoutColor && !accessibilityEnabled ? .red : .white)
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(
                        Capsule()
                            .fill(Color.black)
                            .opacity(0.75)
                    )
                
                ZStack {
                    // MARK: TODO: ForEach is not updating when setting new array in putBack // fix with dispathQueue below
                    ForEach(cards.indices, id: \.self) { index in
                        CardView(card: self.cards[index], setCardsBack: self.$setCardsBack,
                         removal: {
                            withAnimation {
                                self.removeCard(at: index)
                            }
                        }, putBack: {
                            withAnimation {
                                self.putBackCard(at: index)
                            }
                        })
                        .stacked(at: index, in: self.cards.count)
                        .allowsHitTesting(index == self.cards.count - 1)
                        .accessibility(hidden: index < self.cards.count - 1)
                    }
                }
                .allowsHitTesting(timeRemaining > 0)
                if cards.isEmpty {
                    Button("Start Again", action: resetCards)
                        .frame(width: 100, height: 44)
                        .padding()
                        .background(Color.white)
                        .foregroundColor(.black)
                        .clipShape(Capsule())
                }
            }
            VStack {
                HStack {
                    Button(action: {
                        self.editing = false
                        self.showingEditScreen = true
                    }, label: {
                        Text("Settings")
                        .foregroundColor(.white)
                        .padding()
                        .background(
                            Capsule()
                                .fill(Color.black)
                                .opacity(0.75)
                        )
                    })
                    Spacer()
                    Button(action: {
                        self.editing = true
                        self.showingEditScreen = true
                    }) {
                        Image(systemName: "plus.circle")
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                
                Spacer()
            }
            .foregroundColor(.white)
            .font(.largeTitle)
            .padding()
            if differentiateWithoutColor || accessibilityEnabled {
                VStack {
                    Spacer()
                    
                    HStack {
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "xmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Wrong"))
                        .accessibility(hint: Text("Mark your answer as being incorrect."))
                        Spacer()
                        
                        Button(action: {
                            withAnimation {
                                self.removeCard(at: self.cards.count - 1)
                            }
                        }) {
                            Image(systemName: "checkmark.circle")
                                .padding()
                                .background(Color.black.opacity(0.7))
                                .clipShape(Circle())
                        }
                        .accessibility(label: Text("Correct"))
                        .accessibility(hint: Text("Mark your answer as being correct."))
                    }
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()
                }
            }
        }
        .onReceive(timer) { time in
            guard self.isActive else { return }
            if self.timeRemaining > 0 {
                self.timeRemaining -= 1
            }
            
            if self.timeRemaining <= 10 {
                self.feedback.notificationOccurred(.warning)
            } else if self.timeRemaining <= 12 {
                self.feedback.prepare()
            }
            
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            self.isActive = false
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
            if self.cards.isEmpty == false {
                self.isActive = true
            }
        }
        .sheet(isPresented: $showingEditScreen, onDismiss: resetCards) {
            if self.editing {
                EditCards()
            } else {
                SettingsView(setCardsBack: self.$setCardsBack)
            }
        }
        .onAppear(perform: resetCards)
    }
    // MARK: Methods
    func removeCard(at index: Int) {
        guard index >= 0 else { return }
        cards.remove(at: index)
        if cards.isEmpty {
            isActive = false
        }
    }
    
    func putBackCard(at index: Int) {
        guard index >= 0 else { return }
        print("cards = \(cards)")
        let card = cards[index]
        
        cards.remove(at: index)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.cards.insert(card, at: 0)
        }
        
        print("cards = \(cards)")
    }
    
    func resetCards() {
        timeRemaining = 100
        isActive = true
        loadData() 
    }
    
    func loadData() {
        if let data = UserDefaults.standard.data(forKey: "Cards") {
            if let decoded = try? JSONDecoder().decode([Card].self, from: data) {
                self.cards = decoded
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension View {
    func stacked(at position: Int, in total: Int) -> some View {
        let offset = CGFloat(total - position)
        return self.offset(CGSize(width:  offset, height: offset * 10))
    }
}
