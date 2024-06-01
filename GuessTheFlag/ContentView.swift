//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yashavika Singh on 01.06.24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["US", "Nigeria", "UK", "Estonia", "Poland", "Spain", "Ireland", "Italy", "Monaco", "Ukraine"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
        
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    @State private var score = 0
    var body: some View {
        
        ZStack {
            Color.blue.ignoresSafeArea()
            VStack (spacing: 20) {
                VStack {
                    Text("Tap the flag of")
                    Text(countries[correctAnswer])
                }
                .foregroundStyle(.white)
                .padding()
                
                ForEach(0..<3) {number in
                    Button {
                       flagTapped(number)
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
        .alert(scoreTitle, isPresented: $showingScore)
        {
            Button("Continue ", action: askQuestion )
        } message: {
            Text("Your score is \(score)")
        }
    }
    
    
    func flagTapped (_ number: Int) {
        
         if(number == correctAnswer)
        {
              scoreTitle = "Correct"
             score = score + 1
         }
        else
        {
            scoreTitle = "Wrong "
        }
        
        showingScore = true
    }
    
    func askQuestion() {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        }
}

#Preview {
    ContentView()
}
