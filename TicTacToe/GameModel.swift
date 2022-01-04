//
//  GameModel.swift
//  TicTacToe
//
//  Created by Matt Dahl on 1/2/22.
//

import Foundation

class GameModel: ObservableObject{
    
    @Published var game: Game
    @Published var currentTurn: String
    @Published var gameState: String
    @Published var winningSquares: [Int]
    
    init(gameSizeInput: Int){
        game = Game(size: gameSizeInput)
        currentTurn = "X"
        gameState = "X's Turn"
        winningSquares = [Int]()
    }
    
    //Will try to input current players symbol    
    func updateCell(cellId: Int){
        
        let col = cellId % game.boardSize
        let row = cellId / game.boardSize
        
        if(self.game.boardState[row][col] == "" && !isGameOver()){
            self.game.boardState[row][col] = currentTurn
            
            if(isGameOver()){
                if(gameState != "Draw"){
                    gameState = currentTurn + " wins"
                }
            }
            else{
                if(currentTurn == "X"){
                    currentTurn = "O"
                    gameState = currentTurn + "'s Turn"
                } else{
                    currentTurn = "X"
                    gameState = currentTurn + "'s Turn"
                }
            }
        }
        
        

    }
    
    func isGameOver() -> Bool{
        
        
        //check rows
        for rowIndex in 0..<game.boardSize{
            var count = 0
            winningSquares.removeAll()
            for colIndex in 0..<game.boardSize{
                if(game.boardState[rowIndex][colIndex] == currentTurn){
                    count += 1
                    let cellId = rowIndex*game.boardSize + colIndex
                    winningSquares.append(cellId)
                }
            }
            if(count == game.boardSize){
                return true
            }
        }
        
        
        //check columns
        for colIndex in 0..<game.boardSize{
            var count = 0
            winningSquares.removeAll()
            for rowIndex in 0..<game.boardSize{
                if(game.boardState[rowIndex][colIndex] == currentTurn){
                    count += 1
                    let cellId = rowIndex*game.boardSize + colIndex
                    winningSquares.append(cellId)
                }
            }
            if(count == game.boardSize){
                return true
            }
        }
        
        //check left diagonal
        var leftDiagCount = 0
        winningSquares.removeAll()
        for rowIndex in 0..<game.boardSize{
            
            if(game.boardState[rowIndex][rowIndex] == currentTurn){
                leftDiagCount += 1
                let cellId = rowIndex*game.boardSize + rowIndex
                winningSquares.append(cellId)
            }
            if(leftDiagCount == game.boardSize){
                return true
            }
        }
        
        //check right diagonal
        var rightDiagCount = 0
        winningSquares.removeAll()
        for rowIndex in 0..<game.boardSize{
            
            if(game.boardState[rowIndex][game.boardSize-rowIndex-1] == currentTurn){
                rightDiagCount += 1
                let cellId = rowIndex*game.boardSize + (game.boardSize-rowIndex-1)
                winningSquares.append(cellId)
            }
            if(rightDiagCount == game.boardSize){
                return true
            }
        }
        
        
        var drawCount = 0
        for rowIndex in 0..<game.boardSize{
            for colIndex in 0..<game.boardSize{
                if(game.boardState[rowIndex][colIndex] != ""){
                    drawCount += 1
                }
            }
        }
        if(drawCount == game.boardSize * game.boardSize){
            winningSquares.removeAll()
            gameState = "Draw"
            return true
        }
        
        winningSquares.removeAll()
        return false
    }
    
    func resetBoard(){
        winningSquares.removeAll()
        game = Game(size: game.boardSize)
    }
    
}
