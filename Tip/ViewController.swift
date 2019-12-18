//
//  ViewController.swift
//  Tip
//
//  Created by Hongbin on 12/9/19.
//  Copyright © 2019 Hongbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var selected: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    @IBAction func calTip(_ sender: Any) {
        
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        // calculate tip
        let tipPer = [0.15,0.2,0.22]
        
        let tip = bill * tipPer[selected.selectedSegmentIndex]
        let total = bill + tip
        // update total
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
        
    }
    
}

