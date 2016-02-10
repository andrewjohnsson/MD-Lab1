//
//  ViewController.swift
//  MD_Lab1
//
//  Created by Andrew Johnsson on 04.02.16.
//  Copyright © 2016 gingercode. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var field: UITextField!
    @IBOutlet weak var poundsField: UILabel!
    @IBOutlet weak var ouncesField: UILabel!
    @IBOutlet weak var stoneField: UILabel!
    
    @IBAction func dismissKeyboard(sender: AnyObject) {
        self.view.endEditing(true)
    }
    
    @IBAction func convert(sender: AnyObject) {
        if (field.text?.characters.last >= "0") && (field.text?.characters.last <= "9"){
            poundsField.text = "Pounds: " + String(Double(field.text!)! * 2.20462)
            ouncesField.text = "Ounces: " + String(Double(field.text!)! * 35.274)
            stoneField.text = "Stones: " + String(Double(field.text!)! * 0.157473)
        }else{
            if (!field.text!.isEmpty){
                field.text?.removeAtIndex(field.text!.characters.endIndex.predecessor())
            }else{
                poundsField.text = "Pounds"
                ouncesField.text = "Ounces"
                stoneField.text = "Stones"
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSLayoutConstraint(item: view, attribute: .Bottom, relatedBy: .Equal, toItem: self.view.superview, attribute: .Bottom, multiplier: 1, constant: 150)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}