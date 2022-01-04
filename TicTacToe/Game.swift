//
//  Game.swift
//  TicTacToe
//
//  Created by Matt Dahl on 1/2/22.
//

import Foundation

class Game{
    
    var boardSize: Int
    
    /*
     
     (row, col)
     0,0 | 0,1 | 0,2
     ---------------
     1,0 | 1,1 | 1,2
     ---------------
     2,0 | 2,1 | 2,2
     
     
      0  |  1  |  2
     ---------------
      3  |  4  |  5
     ---------------
      6  |  7  |  8
     
     */
    var boardState: [[String]]
    
    init(size: Int){
        self.boardSize = size
        
        self.boardState = [[String]]()
        
        for _ in 0..<size{
            var row = [String]()
            for _ in 0..<size{
                row.append("")
            }
            boardState.append(row)
        }
        
    }
    
}
