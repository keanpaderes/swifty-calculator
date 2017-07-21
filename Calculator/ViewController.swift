//
//  ViewController.swift
//  Calculator
//
//  Created by Kean on 21/07/2017.
//  Copyright © 2017 WhiteWidget. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var isMiddleOfTyping = false
    
    @IBAction func touchDigit(_ sender: UIButton!) {
        let digit =  sender.currentTitle!
        
        switch digit {
            case ".":
                if isMiddleOfTyping {
                    let textInDisplay = display.text!
                    if textInDisplay.range(of:".") == nil {
                        display.text = textInDisplay + digit
                    } else {
                        display.text = textInDisplay
                    }
                }
            default:
                if isMiddleOfTyping {
                    let textInDisplay = display.text!
                    display.text = textInDisplay + digit
                } else {
                    display.text = digit
                    isMiddleOfTyping = true
                }
        }
    }
    
    var displayValue : Double {
        get {
            return Double(display.text!)!
        }
        set {
            display.text = String(newValue)
        }
    }
    
    @IBAction func performOperation(_ sender: UIButton) {
        isMiddleOfTyping = false
        if let mathSymbol = sender.currentTitle {
            switch mathSymbol {
            case "π":
                displayValue = Double.pi
            case "√":
                displayValue = sqrt(displayValue)
            default:
                break;
            }
        }
        
    }
}

