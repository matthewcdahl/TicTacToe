//
//  ContentView.swift
//  TicTacToe
//
//  Created by Matt Dahl on 1/2/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: GameModel
    
    var body: some View {
        
        VStack {
            Spacer()
            Text("Tic Tac Toesy")
                .bold()
                .font(.largeTitle)
                .foregroundColor(.cyan)
            Spacer()
            ZStack{
                Rectangle()
                    .foregroundColor(.black)
                    .frame(height: CGFloat(270 + (model.game.boardSize-2) * 8))
                VStack{
                    ForEach(0..<model.game.boardSize){ rowIndex in
                        HStack{
                            ForEach(0..<model.game.boardSize){ colIndex in
                                let cellId = rowIndex*model.game.boardSize + colIndex
                                Button(action:{
                                    model.updateCell(cellId: cellId)
                                },label:{
                                    CellView(text: model.game.boardState[rowIndex][colIndex], cellId: cellId)
                                })
                                
                            }
                        }
                    }
                }
                
            }
            Spacer()
            Text(model.gameState)
                .padding()
                .font(.largeTitle)
            Spacer()
        }
        .padding(.horizontal, 50)
        .onAppear(perform: {
            model.resetBoard()
        })
        
    }
}

struct CellView: View{
    
    @EnvironmentObject var model: GameModel
    var text: String
    var cellId: Int
    
    
    var body: some View{
        ZStack{
            Rectangle()
                .foregroundColor(model.winningSquares.contains(cellId) ? .green : .white)
                .cornerRadius(0)
                .frame(height : CGFloat(270/model.game.boardSize), alignment: .center)
                .shadow(radius: 0)
            if(model.game.boardSize > 8){
                Text(text)
                    .font(.caption)
            } else{
                Text(text)
                    .font(.largeTitle)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(GameModel(gameSizeInput: 10))
    }
}
