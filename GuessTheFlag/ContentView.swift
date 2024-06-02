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
                RadialGradient(stops: [ .init(color: Color(red: 0.1, green: 0.2, blue: 0.45 ), location: 0.3), .init(color: Color(red: 0.76, green: 0.15, blue: 0.26  ), location: 0.3)], center: .top, startRadius: 200, endRadius: 700)
                
                .ignoresSafeArea()
              
                VStack {
                    Spacer()
                    Text("Guess the Flag")
                        .font(.custom("Georgia", size: 50).bold())
                        .foregroundStyle(.white)
                       
                  
                    
                    
                    VStack (spacing: 15) {
                        VStack {
                            Text("Tap the flag of")
                                .font(.subheadline.weight(.heavy))
                                .foregroundStyle(.secondary)
                            Text(countries[correctAnswer])
                                .font(.largeTitle.weight(.semibold))
                                .foregroundStyle(.black)
                        }
                        
                        .padding()
                        
                        ForEach(0..<3) {number in
                            Button {
                                flagTapped(number)
                            } label: {
                                Image(countries[number])
                                    .clipShape(.capsule)
                                    .shadow(radius: 10)
                            }
                        }
                        
                        
                        
                    }
                    
                    
                    
                    
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 20)
                    .background(.regularMaterial)
                    .clipShape(.rect(cornerRadius: 20))
                    .padding(40)
                    
                    Spacer()
                    Spacer()
                
                    VStack{
                        Text("score: \(score)")
                            .foregroundStyle(.white)
                            .font(.title.bold() )
                    }
                    
                    Spacer()
                    
                }
                
                
          
                
               
            }
            
            .alert(scoreTitle, isPresented: $showingScore)
            {
                Button("Continue ", action: askQuestion )
            }
        message: {
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
