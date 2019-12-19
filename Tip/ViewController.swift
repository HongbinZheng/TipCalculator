//
//  ViewController.swift
//  Tip
//
//  Created by Hongbin on 12/9/19.
//  Copyright © 2019 Hongbin. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    var tipPer = [0.1,0.3,0.4]
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var selected: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Calculator"
        billField.delegate = self
        tipLabel.center.x -= view.bounds.width  
        totalLabel.center.x -= view.bounds.width // Place it on the left of the view with the width = the bounds'width of the view.
        // animate it from the left to the right
        UIView.animate(withDuration: 0.5, animations:{
            self.tipLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
            self.totalLabel.center.x += self.view.bounds.width
            self.view.layoutIfNeeded()
        }, completion: nil)
        selected.setTitle("\(Int(tipPer[0]*100))%", forSegmentAt: 0)
        selected.setTitle("\(Int(tipPer[1]*100))%", forSegmentAt: 1)
        selected.setTitle("\(Int(tipPer[2]*100))%", forSegmentAt: 2)
        billField.becomeFirstResponder()
        let fmt = NumberFormatter()
        fmt.numberStyle = .currency
        fmt.locale = NSLocale.autoupdatingCurrent
        tipLabel.text = fmt.string(from: 0)
        totalLabel.text = fmt.string(from: 0)
    }
    
    func onValueChange(type: Array<Double>) {
        tipPer = type
        selected.setTitle("\(Int(tipPer[0]*100))%", forSegmentAt: 0)
        selected.setTitle("\(Int(tipPer[1]*100))%", forSegmentAt: 1)
        selected.setTitle("\(Int(tipPer[2]*100))%", forSegmentAt: 2)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SettingViewController" {
            if let controller = segue.destination as? SettingViewController{
                print("pass")
                controller.delegate = self
                controller.tipPer = self.tipPer
            }else{
                print("Did not pass")
            }
            
        }else{
            print("not identi")
        }
    }
    
    @IBAction func calTip(_ sender: Any) {
        //Get bill amount
        let bill = Double(billField.text!) ?? 0
        // calculate tip
        
        var precentage = 0.0

            precentage = tipPer[selected.selectedSegmentIndex]
        
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

