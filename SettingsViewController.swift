//
//  SettingsViewController.swift
//  calculator
//
//  Created by Apple on 2016/12/19.
//  Copyright © 2016年 Xinmeng Li. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var DefaultTipControl: UISegmentedControl!
    let tipPercentages = [0.15,0.20,0.22]
    override func viewDidLoad() {
        super.viewDidLoad()
     let defaults = UserDefaults.standard
     DefaultTipControl.selectedSegmentIndex = defaults.integer(forKey: "defaultTip")
    // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SetDefault(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(DefaultTipControl.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
