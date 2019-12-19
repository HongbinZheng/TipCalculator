//
//  SettingViewController.swift
//  Tip
//
//  Created by Hongbin on 12/18/19.
//  Copyright © 2019 Hongbin. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController, UITextFieldDelegate {
    var vc: ViewController?
    var tipPer = [0.0,0.0,0.0]
    @IBOutlet weak var changeField: UITextField!
    weak var delegate: ViewController!
    @IBOutlet weak var selected: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        changeField.text = String(Int(tipPer[0] * 100))
    selected.setTitle("\(Int(tipPer[0]*100))%", forSegmentAt: 0)
    selected.setTitle("\(Int(tipPer[1]*100))%", forSegmentAt: 1)
    selected.setTitle("\(Int(tipPer[2]*100))%", forSegmentAt: 2)
        changeField.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        changeField.resignFirstResponder()
    }
    
    @IBAction func onChange(_ sender: Any) {
        changeField.text = String(Int(tipPer[selected.selectedSegmentIndex] * 100))
    }
    @IBAction func changeValue(_ sender: Any) {
        let value = Int(changeField.text!) ?? 0
        
        if value != 0 {
            tipPer[selected.selectedSegmentIndex] = Double(value) / 100
            selected.setTitle("\(Int(tipPer[selected.selectedSegmentIndex]*100))%", forSegmentAt: selected.selectedSegmentIndex)
            
            delegate?.onValueChange(type: tipPer)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
extension ViewController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
