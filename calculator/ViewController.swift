//
//  ViewController.swift
//  calculator
//
//  Created by Apple on 2016/12/16.
//  Copyright © 2016年 Xinmeng Li. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var sharetipLabel: UILabel!
    @IBOutlet weak var sharetotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        let DefaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = DefaultTip
        }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        let defaults = UserDefaults.standard
        let DefaultTip = defaults.integer(forKey: "defaultTip")
        tipControl.selectedSegmentIndex = DefaultTip
        calculateTip(tipControl)
        view.endEditing(true)
    }
  
    @IBAction func calculateTip(_ sender: Any) {
        let tipPercentages = [0.15,0.20,0.22]
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let people = Double(peopleField.text!) ?? 1
        let shareTip = tip / people
        let shareTotal = total / people
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        sharetipLabel.text = String(format: "$%.2f", shareTip)
        sharetotalLabel.text = String(format: "$%.2f", shareTotal)
    }
    
}

