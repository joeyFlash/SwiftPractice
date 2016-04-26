//
//  ViewController.swift
//  PicturesApp
//
//  Created by Joseph Hernandez on 4/21/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    @IBOutlet var animationImage: UIImageView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateImage(sender: AnyObject)
    {
        
        if(counter == 6)
        {
            counter = 0
        }
        else
        {
            counter += 1
        }
        
        animationImage.image = UIImage(named: "frame\(counter).png")
    }

}

