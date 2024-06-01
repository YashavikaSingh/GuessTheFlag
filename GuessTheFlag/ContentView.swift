//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Yashavika Singh on 01.06.24.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["US", "Nigeria", "UK", "Estonia", "Poland", "Spain", "Ireland", "Italy", "Monaco", "Ukraine"]
    @State var correctAnswer = Int.random(in: 0...2)
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
                        
                    } label: {
                        Image(countries[number])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
