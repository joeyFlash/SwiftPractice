//
//  ViewController.swift
//  ControllingKeyboardApp
//
//  Created by Joseph Hernandez on 4/16/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet var label: UILabel!
    
    @IBOutlet var text: UITextField!
    
    @IBAction func updateLabel(sender: AnyObject)
    {
        label.text = text.text
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.text.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }

    func textFieldShouldReturn(textField: UITextField)-> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }
}

