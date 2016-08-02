//
//  ViewController.swift
//  WorkWithAudio
//
//  Created by Joseph Hernandez on 8/1/16.
//  Copyright © 2016 Skgood Inc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var player :AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func playButton(sender: AnyObject) {
        
        let audioPath = NSBundle.mainBundle().pathForResource("UltralightBeam", ofType: "mp3")!
        
        do
        {
            player = try AVAudioPlayer(contentsOfURL: NSURL(string: audioPath)!)
            
        }
        catch let error as NSError
        {
           print(error)
        }
        
        
        player.play()
    }
    
    
    
    @IBAction func pauseButton(sender: AnyObject) {
        
        player.pause()
    }
    
    
    @IBAction func sliderChanged(sender: AnyObject) {
        
        player.volume = sliderValue.value
    }
    
    
    @IBOutlet var sliderValue: UISlider!
    
}

