//
//  ContentView.swift
//  WordScramble
//
//  Created by Victor Rolando Sanchez Jara on 4/25/20.
//  Copyright © 2020 Victor Rolando Sanchez Jara. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    // MARK: Properties
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    @State private var showingError = false
    
    @State private var score: Int = 0
    
    // MARK: Body
    var body: some View {
        NavigationView {
                VStack {
                    TextField("Enter your word", text: self.$newWord, onCommit: self.addNewWord)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .padding()
                     GeometryReader { geoList in
                        List(self.usedWords, id: \.self) { word in
                                GeometryReader { geo in
                                    HStack {
                                        HStack {
                                            Image(systemName: "\(word.count).circle")
                                                .foregroundColor(Color(red: Double(geo.frame(in: .global).maxY / geoList.frame(in: .global).maxY), green: Double(geo.frame(in: .global).maxY / geoList.frame(in: .global).maxY), blue: Double(geo.frame(in: .global).maxY / geoList.frame(in: .global).maxY)))
                                            Text(word)
                                        }
                                        
                                        .accessibilityElement(children: .ignore)
                                        .accessibility(label: Text("\(word), \(word.count) letters"))
                                        Spacer()
                                        Text("Score: \(self.score)")
                                        
                                    }
                                    .offset(x: geo.frame(in: .global).minY > 500 ? (geo.frame(in: .global).minY - 500)*0.7 : 0)
                                    
                            }
                        }
                        .navigationBarTitle(self.rootWord)
                        .navigationBarItems(trailing: Button(action: {
                            self.startGame()
                        }) {
                            Text("Restart")
                                .font(.title)
                        })
                        .onAppear(perform: self.startGame)
                        .alert(isPresented: self.$showingError) {
                            Alert(title: Text(self.errorTitle), message: Text(self.errorMessage), dismissButton: .default(Text("OK")))
                        }
                    }
            }
        }
    }
    
    // MARK: Methods
    func startGame() {
        // 1. Find the URL for start.txt in our app bundle
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            // 2. Load start.txt into a string
            if let startWords = try? String(contentsOf: startWordsURL) {
                // 3. Split the string up into an array of strings, splitting on line breaks
                let allWords = startWords.components(separatedBy: "\n")
                
                // 4. Pick one random word, or use "silkworm" as a sensible default
                rootWord = allWords.randomElement() ?? "silkworm"
                
                // If we are here everything has worked, so we can exit
                return
            }
        }
        
        // If were are *here* then there was a problem – trigger a crash and report the error
        fatalError("Could not load start.txt from bundle.")
    }
    
    func addNewWord() {
        // lowercase and trim the word, to make sure we don't add duplicate words with case differences
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        // exit if the remaining string is empty
        guard answer.count > 0 else {
            return
        }
        
        guard answer != rootWord else {
            wordError(title: "Word is same as root word", message: "Be more original")
            return
        }
        
        guard hasThreeOrMoreLetters(word: answer) else {
            wordError(title: "Word is too short", message: "Use three or more letters")
            return
        }
        
        guard isOriginal(word: answer) else {
            wordError(title: "Word used already", message: "Be more original")
            return
        }
        
        guard isPossible(word: answer) else {
            wordError(title: "Word not recognized", message: "You can't just make them up, you know!")
            return
        }
        
        guard isReal(word: answer) else {
            wordError(title: "Word not possible", message: "That isn't a real word.")
            return
        }

        score += Int((Double(answer.count) * (1/3)).rounded())
        
        usedWords.insert(answer, at: 0)

        newWord = ""
        
        
    }
    
    
    func hasThreeOrMoreLetters(word: String) -> Bool {
        word.count >= 3
    }
    
    func isOriginal(word: String) -> Bool {
        !usedWords.contains(word)
    }
    
    func isPossible(word: String) -> Bool {
        var tempWord = rootWord
        
        for letter in word {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return false
            }
        }
        
        return true
    }
    
    func isReal(word: String) -> Bool {
        let checker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        return misspelledRange.location == NSNotFound
    }
    
    func wordError(title: String, message: String) {
        errorTitle = title
        errorMessage = message
        showingError = true
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
