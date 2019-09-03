//
//  CalculatorViewController.swift
//  strassen
//
//  Created by Ian Hall on 9/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
//numberButtons

    //matrixA
    @IBOutlet weak var cell1: UITextField!
    
    @IBOutlet weak var cell2: UITextField!
    
    @IBOutlet weak var cell3: UITextField!
    
    @IBOutlet weak var cell4: UITextField!
    
    
    
    
    
    //matrixB
    
    @IBOutlet weak var cell5: UITextField!
    
    @IBOutlet weak var cell6: UITextField!
    
    @IBOutlet weak var cell7: UITextField!
    
    @IBOutlet weak var cell8: UITextField!
    
    var currentCell:Int = 0
    

    
    //answerMatrix
    
    //answerMatrix
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        
    }
    
    @IBAction func numberButtonTapped(_ sender: Any) {
        guard let number = (sender as AnyObject).tag else {return}
        var cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]
        
        
        if currentCell < cellCycle.count{
            cellCycle[currentCell]?.text = "\(number)"
            currentCell = currentCell + 1
        }
    }
    @IBAction func calculateButtonTapped(_ sender: Any) {
        let cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]
        var intArray:[Int] = []
        var areCellsFull = true
        for cell in cellCycle{
            if cell?.text == ""{
                areCellsFull = false
            } else {
                guard let cellInt = Int(cell!.text!)  else {return}
                intArray.append(cellInt)
            }
        }
        if areCellsFull{
        
            let matrixa = [[intArray[0],intArray[1]],[intArray[2], intArray[3]]]
            let matrixb = [[intArray[4],intArray[5]],[intArray[6], intArray[7]]]
            FormulaController.sharedInstance.multiplyMatirx(matrixA: matrixa, matrixB: matrixb)
        }
    }
    
    func calculateData(){
        
    }

}
