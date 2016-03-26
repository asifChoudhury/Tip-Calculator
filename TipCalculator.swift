//
//  FirstViewController.swift
//  Tip Calculator
//
//  Created by Md asif choudhury on 8/18/15.
//  Copyright © 2015 BlueFish. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipFromSlider: UISlider!
    @IBOutlet weak var tipFromTextField: UITextField!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBAction func billChanged(sender: AnyObject) {
        calculateTotal()
    }

    @IBAction func sliderMoved(sender: AnyObject) {
        tipFromTextField.text = "\(Int(tipFromSlider.value))"
        calculateTotal()
    }
    @IBAction func tipsEntered(sender: AnyObject) {
        if let tipPercent:Int = Int(tipFromTextField.text!) {
            calculateTotal()
        }
    }
    func calculateTotal() {
        if let bill:Double = Double(billAmount.text!) {
            let tipPercent = Double(Int(tipFromTextField.text!)!) / 100
            var total:Double =  bill + (bill * tipPercent)
            totalLabel.text = String(format: "Total = $%.2f", Float(total))
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.purpleColor()
        billAmount.text = "100"
        tipFromTextField.text = "\(Int(tipFromSlider.value))"
        calculateTotal()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

