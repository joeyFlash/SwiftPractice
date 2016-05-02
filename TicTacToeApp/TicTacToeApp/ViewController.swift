//
//  ViewController.swift
//  TicTacToeApp
//
//  Created by Joseph Hernandez on 4/26/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var button: UIButton!
    
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        var image = UIImage(named: "cross.png")
        
        sender.setImage(image, forState: .Normal)
        
        print(sender.tag)
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
