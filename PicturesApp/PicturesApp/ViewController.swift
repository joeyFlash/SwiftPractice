//
//  ViewController.swift
//  PicturesApp
//
//  Created by Joseph Hernandez on 4/21/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var animationImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateImage(sender: AnyObject)
    {
        animationImage.image = UIImage(named: "frame1.png")
        
    }

}

