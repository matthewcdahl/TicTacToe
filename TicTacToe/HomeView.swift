//
//  HomeView.swift
//  TicTacToe
//
//  Created by Matt Dahl on 1/2/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var selectedSize = 3
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                Text("Tic Tac Toe")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(.cyan)
                Spacer()
                
                Text("Board Size")
                    .font(.title2)
                    .padding()
                Picker("Size", selection: $selectedSize){
                    Text("1").tag(1)
                    Text("2").tag(2)
                    Text("3").tag(3)
                    Text("4").tag(4)
                    Text("5").tag(5)
                    Text("6").tag(6)
                    Text("10").tag(10)
                   
                }
                .pickerStyle(.segmented)
                .frame(height: 20, alignment: .leading)
                .padding()
                
                NavigationLink(destination: {
                    ContentView()
                        .environmentObject(GameModel(gameSizeInput: selectedSize))
                }) {
                    Text("Start New Game")
                        .font(.title2)
                }
                .padding(.top, 40)
                Spacer()
                Spacer()
                
            }
        }
        .navigationBarHidden(true)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
