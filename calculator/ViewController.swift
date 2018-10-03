//
//  ViewController.swift
//  calculator
//
//  Created by Heena Patel on 12/23/17.
//  Copyright © 2017 Heena Patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var numberOnScreen:Double = 0;
    var operationInUse = false;
    var operation = 0;
    var previousNumber:Double = 0;
    var digitCount:Int = 0;
    var operationCount:Int = 0;
    var clearCount:Int = 0;
    var answer:Double = 0;
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var addition: UIButton!
    @IBOutlet weak var subtraction: UIButton!
    @IBOutlet weak var multiplication: UIButton!
    @IBOutlet weak var division: UIButton!
    @IBOutlet weak var clear: UIButton!
    
    @IBAction func numberButton(_ sender: UIButton) {
        if(operationInUse == true)
        {
            operationInUse = false;
        }
        if(digitCount == 0 && sender.tag < 16)
        {
            label.text = String(sender.tag);
            digitCount = digitCount + 1;
        }
        else if(sender.tag == 16 && digitCount == 0)
        {
            label.text = "0.";
            digitCount = digitCount + 1;
        }
        else if(sender.tag == 16)
        {
            label.text = label.text! + ".";
        }
        else
        {
            if(digitCount < 8)
            {
                label.text = label.text! + String(sender.tag);
                digitCount = digitCount + 1;
            }
        }
        clearCount = 0;
        numberOnScreen = Double(label.text!)!
        clear.setTitle("C", for: .normal);
    }
    
    
    @IBAction func operationButtons(_ sender: UIButton) {
        if label.text != "" && sender.tag != 10 && sender.tag != 15
        {
            if(operationCount > 0)
            {
                if(operation == 11)
                {
                    answer = previousNumber / numberOnScreen;
                }
                if(operation == 12)
                {
                    answer = previousNumber * numberOnScreen;
                }
                
                if(operation == 13)
                {
                    answer = previousNumber - numberOnScreen;
                }
                
                if(operation == 14)
                {
                    answer = previousNumber + numberOnScreen;
                }
                let checkInt = Int(answer.rounded());
                if(Double(checkInt) == answer)
                {
                    label.text = String(checkInt);
                }
                else
                {
                    label.text = String(answer);
                }
            }
            
            if(sender.tag == 11) //Divide
            {
                    addition.layer.borderWidth = 0;
                    subtraction.layer.borderWidth = 0;
                    multiplication.layer.borderWidth = 0;
                    division.layer.borderWidth = 1;
            }
            if(sender.tag == 12) //Multiply
            {
                    addition.layer.borderWidth = 0;
                    subtraction.layer.borderWidth = 0;
                    multiplication.layer.borderWidth = 1;
                    division.layer.borderWidth = 0;
            }
            if(sender.tag == 13) //Subtract
            {
                    addition.layer.borderWidth = 0;
                    subtraction.layer.borderWidth = 1;
                    multiplication.layer.borderWidth = 0;
                    division.layer.borderWidth = 0;
            }
            if(sender.tag == 14) //Add
            {
                    addition.layer.borderWidth = 1;
                    subtraction.layer.borderWidth = 0;
                    multiplication.layer.borderWidth = 0;
                    division.layer.borderWidth = 0;
            }
            
            previousNumber = Double(label.text!)!
            operation = sender.tag;
            operationInUse = true;
            digitCount = 0;
            operationCount = operationCount + 1;
        }
        else if(sender.tag == 15) //Equal
        {
            addition.layer.borderWidth = 0;
            subtraction.layer.borderWidth = 0;
            multiplication.layer.borderWidth = 0;
            division.layer.borderWidth = 0;
            
            if(operation == 11)
            {
                answer = previousNumber / numberOnScreen;
            }
            if(operation == 12)
            {
                answer = previousNumber * numberOnScreen;
            }

            if(operation == 13)
            {
                answer = previousNumber - numberOnScreen;
            }

            if(operation == 14)
            {
                answer = previousNumber + numberOnScreen;
            }
            let checkInt = Int(answer.rounded());
            if(Double(checkInt) == answer)
            {
                label.text = String(checkInt);
            }
            else
            {
                label.text = String(answer);
            }
            operationCount = 0;
            previousNumber = Double(label.text!)!
        }
        else if(sender.tag == 10 && clearCount == 0) //C
        {
            label.text = "0";
            numberOnScreen = 0;
            clearCount = clearCount + 1;
            digitCount = 0;
            operationInUse = true;
            clear.setTitle("AC", for: .normal);
        }
        else if(sender.tag == 10 && clearCount == 1) //AC
        {
            label.text = "0";
            previousNumber = 0;
            numberOnScreen = 0;
            operation = 0;
            operationInUse = false;
            digitCount = 0;
            addition.layer.borderWidth = 0;
            subtraction.layer.borderWidth = 0;
            multiplication.layer.borderWidth = 0;
            division.layer.borderWidth = 0;
            operationCount = 0;
            clearCount = 0;
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

