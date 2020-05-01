//
//  GameView.swift
//  Day35Challenge
//
//  Created by Victor Rolando Sanchez Jara on 5/1/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct GameView: View {
    // MARK: Properties
    @Binding var maxLevel: Int
    @Binding var numberOfQuestions: Int
    @Binding var gameIsRunning: Bool
    
    @State var currentLevel: Int = 0
    @State var totalQuestions: [Question] = []
    @State var randomQuestions: [Question] = []
    
    @State var answer: String = ""
    
    @State private var showingAlert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    @State private var score = 0
    @State private var shouldRestart = false
    
    // MARK: Body
    var body: some View {
        VStack {
            HStack {
                Text(randomQuestions.isEmpty ? "" : "\(randomQuestions[currentLevel].question) = ")
                TextField("Enter answer here", text: $answer, onCommit: checkAnswer)
                .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            .padding()
            Button(action: {
                self.checkAnswer()
            }) {
                Text("Submit answer!")
            }
            Text("Current Score: \(score)")
        }
        .navigationBarTitle("Mathplay")
        .onAppear(perform: startGame)
        .alert(isPresented: $showingAlert) {
            Alert(title: Text(alertTitle), message: Text(alertMessage), dismissButton: .default(Text("OK")){
                if self.shouldRestart {
                    self.gameIsRunning = false
                    }
                })
        }
    }
    
    // MARK: Methods
    func startGame() {
        for level in 1...maxLevel {
            guard let levelURL = Bundle.main.url(forResource: "questions_\(level)", withExtension: "txt") else {
                fatalError("Could not level URL from bundle.")
            }
            guard let questionsList = try? String(contentsOf: levelURL) else {
                fatalError("Could not load questions from level.")
            }
            
            let questionsArray = questionsList.components(separatedBy: "\n")
            
            for questionAnswer in questionsArray {
                let components = questionAnswer.components(separatedBy: "=")
                let question = Question(question: components[0], answer: components[1])
                
                totalQuestions.append(question)
            }
        }
        
        totalQuestions.shuffle()
        
        // All questions
        randomQuestions = Array(totalQuestions.prefix(numberOfQuestions))
        
        
    }
    
    func checkAnswer(){
        let correctAnswer = randomQuestions[currentLevel].answer
        if answer == correctAnswer {
            alertTitle = "Great job!"
            alertMessage = "You got the right answer"
            score += 1
        } else {
            alertTitle = "That's not it.."
            alertMessage = "The right answer is \(correctAnswer)"
        }
        
        answer = ""
        
        
        if currentLevel < numberOfQuestions-1 {
            currentLevel += 1
        } else {
            shouldRestart = true
            alertTitle = "Good game!"
            alertMessage = "Your final score is \(score)"
        }
        
        showingAlert = true
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(maxLevel: .constant(3), numberOfQuestions: .constant(10), gameIsRunning: .constant(true))
    }
}
