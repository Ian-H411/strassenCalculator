//
//  CalculatorViewController.swift
//  strassen
//
//  Created by Ian Hall on 9/2/19.
//  Copyright © 2019 Ian Hall. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
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
    
    var number = ""
    
    //answerMatrix
    
    //answerMatrix
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        
        
    }
    
    @IBAction func numberButtonTapped(_ sender: Any) {
        
    }
    

}
