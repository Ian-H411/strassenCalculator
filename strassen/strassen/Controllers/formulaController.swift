//
//  formulaController.swift
//  strassen
//
//  Created by Ian Hall on 9/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import Foundation


class FormulaController{
    
    static let sharedInstance = FormulaController()
    
   func multiplyMatirx(matrixA:[[Int]], matrixB:[[Int]]){
        var answerMatrix = [Int]()
        var AmatrixAsArray = [Int]()
        var BmatrixASArray = [Int]()
        for line in matrixA{
            for num in line{
                AmatrixAsArray.append(num)
            }
        }
        for line in matrixB{
            for num in line{
                BmatrixASArray.append(num)
            }
        }
        //bookmark so i can watch the flip backs
        var bookMarkB = 0
        var bookMarkA = 0
        for _ in matrixB{
            for _ in 0...matrixB[0].count - 1{
                let answerPart1 = (AmatrixAsArray[bookMarkA] * BmatrixASArray[bookMarkB] )
                let answerPart2 = (AmatrixAsArray[bookMarkA + 1] * BmatrixASArray[bookMarkB + 2])
                let answer = answerPart1 + answerPart2
                answerMatrix.append(answer)
                bookMarkB = bookMarkB + 1
            }
            bookMarkB = 0
            bookMarkA = 2
            
    }
        for line in answerMatrix{
            print(line)
        }
        
    }
}
