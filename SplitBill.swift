//
//  SecondViewController.swift
//  Tip Calculator
//
//  Created by Md asif choudhury on 8/18/15.
//  Copyright © 2015 BlueFish. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipFromSlider: UISlider!
    @IBOutlet weak var tipFromTextField: UITextField!
    @IBOutlet weak var splitBetweenSlider: UISlider!
    @IBOutlet weak var splitBetweenTextField: UITextField!
    @IBOutlet weak var totalCost: UILabel!
    
    @IBAction func billEntered(sender: AnyObject) {
        calculateTotal()
    }

    @IBAction func tipSliderMoved(sender: AnyObject) {
        tipFromTextField.text = "\(Int(tipFromSlider.value))"
        calculateTotal()
    }
    
    @IBAction func tipsEntered(sender: AnyObject) {
        if let tipPercent:Int = Int(tipFromTextField.text!) {
            calculateTotal()
        }
    }
    
    @IBAction func splitSliderMoved(sender: AnyObject) {
        splitBetweenTextField.text = "\(Int(splitBetweenSlider.value))"
        calculateTotal()
    }
    
    @IBAction func splitEntered(sender: AnyObject) {
        if let split:Int = Int(splitBetweenTextField.text!) {
            calculateTotal()
        }
    }

    func calculateTotal() {
        if let bill:Double = Double(billAmount.text!) {
            let tipPercent = Double(Int(tipFromTextField.text!)!) / 100
            let split = Int(splitBetweenTextField.text!)!
            let total:Double =  (bill + bill * tipPercent) / Double(split)
            totalCost.text = String(format: "$%.2f per person", Float(total))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        tipFromTextField.text = "\(Int(tipFromSlider.value))"
        splitBetweenTextField.text = "\(Int(splitBetweenSlider.value))"
        billAmount.text = "100"
        calculateTotal()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

