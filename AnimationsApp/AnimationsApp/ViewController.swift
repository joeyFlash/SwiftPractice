//
//  ViewController.swift
//  AnimationsApp
//
//  Created by Joseph Hernandez on 4/20/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var wolvImage: UIImageView!
    
    @IBAction func updateImage(sender: AnyObject)
    {
         wolvImage.image = UIImage(named: "frame2.png")
        
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

