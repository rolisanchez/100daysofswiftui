//
//  ContentView.swift
//  Day25Challenge
//
//  Created by Victor Rolando Sanchez Jara on 4/23/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    private var moves = ["Rock", "Paper", "Scissors"]
    
    let ROCK = 0
    let PAPER = 1
    let SCISSORS = 2
    
    let WIN = 0
    let LOSE = 1
    
    private var outcomes = ["Win", "Lose"]
    
    @State var robotMove = Int.random(in: 0...2)
    @State var robotWantsPlayer = Int.random(in: 0...1)
    
    @State private var score = 0
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var turns = 0
    let MAX_TURNS = 10
    
    // MARK: Body
    var body: some View {
        ZStack {
            
            LinearGradient(gradient: Gradient(colors: [.gray, .orange]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 12) {
                if turns == MAX_TURNS {
                    Text("GAME FINISHED")
                    .fontWeight(.black)
                    .font(.largeTitle)
                    .foregroundColor(.red)
                }
                Text("Current score: \(score)")
                .foregroundColor(.white)
                Text("Turn: \(turns)/\(MAX_TURNS)")
                    .foregroundColor(.white)
                HStack {
                    Text("Robot played")
                    Text("\(moves[robotMove])")
                        .fontWeight(.black).underline()
                }
                .font(.largeTitle)
                .foregroundColor(.white)
                HStack {
                    Text("Robot wants you to")
                    Text("\(outcomes[robotWantsPlayer])")
                        .fontWeight(.black).underline()
                        .foregroundColor(robotWantsPlayer == WIN ? .green : .red)
                }
                .font(.largeTitle)
                
                .foregroundColor(.white)
                
                
                ForEach(0..<3) { number in
                    Button(action: {
                        self.playMove(number)
                    }) {
                        Text("Play \(self.moves[number])")
                            .font(.title)
                    }
                    .disabled(self.turns == self.MAX_TURNS)
                }
            }
        }
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.restart()
                })
        }
    }
    
    // MARK: Methods
    func playMove(_ number: Int) {
        turns += 1
        
        var neededMove: Int!
        
        if robotWantsPlayer == 0 {
            neededMove = losesAgainst(robotMove)
        } else {
            neededMove = winsAgainst(robotMove)
        }
        
        if number == neededMove {
            score += 1
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong! You needed to play \(moves[neededMove])"
            score -= 1
        }
        
        if turns == MAX_TURNS {
            scoreTitle = "Game Finished. Your score is: \(score)"
        }
        showingScore = true
    }
    
    func winsAgainst(_ number: Int) -> Int{
        switch number {
        case ROCK:
            return SCISSORS
        case PAPER:
            return ROCK
        case SCISSORS:
            return PAPER
        default:
            return SCISSORS
        }
    }
    
    func losesAgainst(_ number: Int) -> Int{
        switch number {
            case ROCK:
                return PAPER
            case PAPER:
                return SCISSORS
            case SCISSORS:
                return ROCK
            default:
                return PAPER
        }
    }
    
    func restart() {
        robotMove = Int.random(in: 0...2)
        robotWantsPlayer = Int.random(in: 0...1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
