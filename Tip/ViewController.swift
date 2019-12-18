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
        tipLabel.center.x -= view.bounds.width  
        totalLabel.center.x -= view.bounds.width // Place it on the left of the view with the width = the bounds'width of the view.
        // animate it from the left to the right
        UIView.animate(withDuration: 0.5, animations:{
            self.tipLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            self.totalLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)

        billField.becomeFirstResponder()
        customLabel.isHidden = true
        customField.isHidden = true
        percent.isHidden = true
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        fmt.locale = NSLocale.autoupdatingCurrent
        tipLabel.text = fmt.string(from: 0)
        totalLabel.text = fmt.string(from: 0)
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
        let fmt = NumberFormatter()
        fmt.groupingSeparator = ","
        fmt.numberStyle = .currency
        tipLabel.text = fmt.string(from: NSNumber(value:tip))
        totalLabel.text = fmt.string(from:NSNumber(value:total))
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
        let fmt = NumberFormatter()
        fmt.groupingSeparator = ","
        fmt.numberStyle = .currency
        fmt.locale = NSLocale.autoupdatingCurrent
        
        tipLabel.text = fmt.string(from: NSNumber(value:tip))
        totalLabel.text = fmt.string(from:NSNumber(value:total))
    }
}
