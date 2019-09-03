//
//  CalculatorViewController.swift
//  strassen
//
//  Created by Ian Hall on 9/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController, UITextFieldDelegate {
    //MARK: - OUTLETS
    //numberButtons
    
    @IBOutlet weak var num1: UIButton!
    
    @IBOutlet weak var num2: UIButton!
    
    @IBOutlet weak var num3: UIButton!
    
    @IBOutlet weak var num4: UIButton!
    
    @IBOutlet weak var num5: UIButton!
    
    @IBOutlet weak var num6: UIButton!
    
    @IBOutlet weak var num7: UIButton!
    
    @IBOutlet weak var num8: UIButton!
    
    @IBOutlet weak var num9: UIButton!
    
    @IBOutlet weak var num0: UIButton!
    
    //matrixA
    @IBOutlet weak var cell1: UITextField!
    
    @IBOutlet weak var cell2: UITextField!
    
    @IBOutlet weak var cell3: UITextField!
    
    @IBOutlet weak var cell4: UITextField!
    
    //delete and clear
    
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var clearTablesButton: UIButton!
    //matrixB
    
    @IBOutlet weak var cell5: UITextField!
    
    @IBOutlet weak var cell6: UITextField!
    
    @IBOutlet weak var cell7: UITextField!
    
    @IBOutlet weak var cell8: UITextField!
    
    //navigation variables
    
    var currentCell:Int = 0
    
    var clearTableMode = false
    
    //answer matrix
    
    @IBOutlet weak var answerCell1: UITextField!
    
    @IBOutlet weak var answerCell2: UITextField!
    
    @IBOutlet weak var answerCell3: UITextField!
    
    @IBOutlet weak var answerCell4: UITextField!
    
    //a container for all cells
    
    //MARK: - LIFECYCLE
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpUI()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func setUpUI(){
        let cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8, answerCell1, answerCell2, answerCell3, answerCell4]
        let buttonCycle = [num0,num1,num2,num3,num4,num5,num6,num7,num8,num9,num0]
        UIView.animate(withDuration: 6.0, delay: 0.0, options:[.repeat, .transitionFlipFromBottom, .autoreverse, .allowUserInteraction], animations: {
            self.view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        }, completion:nil)
        for cell in cellCycle{
            cell?.backgroundColor = .clear
            cell?.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            cell?.layer.borderWidth = 1.0
            cell?.layer.cornerRadius = 10
        }
        clearTablesButton.setTitle("", for: .normal)
        for numberButton in buttonCycle{
            numberButton?.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            numberButton?.layer.borderWidth = 1.0
            numberButton?.layer.cornerRadius = 10
        }
    }
    //MARK: - ACTIONS
    @IBAction func numberButtonTapped(_ sender: Any) {
        
        guard let number = (sender as AnyObject).tag else {return}
        var cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8]
        if currentCell < cellCycle.count{
            cellCycle[currentCell]?.text = "\(number)"
            currentCell = currentCell + 1
            if currentCell == 1 {
                clearTablesButton.setTitle("Clear Tables", for: .normal)
            }
        }
        if currentCell == 8{
            calculate()
            clearTablesButton.setTitle("", for: .normal)
        }
        
    }
    
    @IBAction func deleteButtonTapped(_ sender: Any) {
        let cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8, answerCell1, answerCell2, answerCell3, answerCell4]
        if clearTableMode{
            for cell in cellCycle{
                cell?.text = ""
            }
            deleteButton.setTitle("Delete", for: .normal)
            clearTableMode = false
            currentCell = 0
        } else{
            currentCell = currentCell - 1
            if currentCell < 0{
                currentCell = 0
            } else if currentCell == 0{
                clearTablesButton.setTitle("", for: .normal)
            }
            cellCycle[currentCell]?.text = ""
        }
    }
    
    @IBAction func clearTableButtonTapped(_ sender: Any) {
         let cellCycle = [cell1,cell2,cell3,cell4,cell5,cell6,cell7,cell8, answerCell1, answerCell2, answerCell3, answerCell4]
            for cell in cellCycle{
                cell?.text = ""
        }
        currentCell = 0
        clearTablesButton.setTitle("", for: .normal)
    }
    
    //MARK: - HELPER FUNCTIONS
    func calculate() {
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
            let results = FormulaController.sharedInstance.multiplyMatirx(matrixA: matrixa, matrixB: matrixb)
            populateAnswerMatrix(answerArray: results)
        }
    }
    
    func populateAnswerMatrix(answerArray: [Int]){
        answerCell1.text = "\(answerArray[0])"
        answerCell2.text = "\(answerArray[1])"
        answerCell3.text = "\(answerArray[2])"
        answerCell4.text = "\(answerArray[3])"
        deleteButton.setTitle("ClearTables", for: .normal)
        
        clearTableMode = true
        
    }
    
    
}
