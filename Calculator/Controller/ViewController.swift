//
//  ViewController.swift
//  Calcy
//
//  Created by Jagdev Singh Jhajj on 2020-06-05.
//  Copyright © 2020 Jagdev Singh Jhajj. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var displayLabel: UILabel!
    
    private var isFinishedTypingNumber: Bool = true
    
    private var displayValue: Double {
        get{
            guard let number = Double(displayLabel.text!) else{
                fatalError("Conversion failed")
            }
            return number
        }
        set{
            displayLabel.text = String(newValue)
        }
    }
    
    private var calculator = CalculatorLogic()
    
    @IBAction func calcButtonPressed(_ sender: UIButton) {
        
        //What should happen when a non-number button is pressed
        
        isFinishedTypingNumber = true
        
        
        calculator.setNumber(displayValue)
        
        
        if let calcMethod = sender.currentTitle{
            
            
            guard let result = calculator.Calculate(symbol: calcMethod) else{
                fatalError("The result is nil")
            }
            displayValue = result
        }
        
        
        
    }
    
    
    @IBAction func numButtonPressed(_ sender: UIButton) {
        
        //What should happen when a number is entered into the keypad
        
        if let numValue = sender.currentTitle {
            
            if isFinishedTypingNumber{
                if numValue == "." && (displayLabel.text == "0" || displayLabel.text == "0.0"){
                    displayLabel.text = "0."
                    
                }else{
                    displayLabel.text = numValue
                    
                }
                isFinishedTypingNumber = false
            }
            else{
                
                if numValue == "."{
                let isInt = floor(displayValue) == displayValue
                
                if !isInt{
                    return
                }
                }
                displayLabel.text = displayLabel.text! + numValue
            }
            
        }
        
    }
    
}



