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
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var percent: UILabel!
    @IBOutlet weak var customField: UITextField!
    @IBOutlet weak var selected: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        customLabel.isHidden = true
        customField.isHidden = true
        percent.isHidden = true
        billField.delegate = self
        customField.delegate = self
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func getCustomer(_ sender: Any) {
        let bill = Double(billField.text!) ?? 0
        let customer = (Double(customField.text!) ?? 0) / 100
        let tip = bill * customer
        let total = bill + tip
        // update total
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
    @IBAction func calTip(_ sender: Any) {
        
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        // calculate tip
        let tipPer = [0.15,0.2,0.22]
        var precentage = 0.0
        if selected.selectedSegmentIndex != 3{
            customField.isHidden = true
            customLabel.isHidden = true
            percent.isHidden = true
            precentage = tipPer[selected.selectedSegmentIndex]
        }else{
            customField.isHidden = false
            customLabel.isHidden = false
            percent.isHidden = false
        }
        let tip = bill * precentage
        let total = bill + tip
        // update total
        tipLabel.text = String(format:"$%.2f",tip)
        totalLabel.text = String(format:"$%.2f",total)
    }
}

extension ViewController:UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
