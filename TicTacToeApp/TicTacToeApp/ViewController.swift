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
    
    var activePlayer = 1
    
    var gameActive = true
    
    var gameBoard = [0,0,0,0,0,0,0,0,0]
    
    var winningCombos = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    
    @IBAction func buttonPressed(sender: AnyObject) {
        
        
        if(gameBoard[sender.tag] == 0 && gameActive)
        {
            var image = UIImage()
            
            //updates the gameboard to whats been pressed
            gameBoard[sender.tag] = activePlayer
            
            if(activePlayer == 1)
            {
                image = UIImage(named: "nought.png")!
                
                activePlayer = 2
            }
            else
            {
                image = UIImage(named: "cross.png")!
                
                activePlayer = 1
                
            }
            
            
            for combo in winningCombos
            {
               if(gameBoard[combo[0]] != 0 && gameBoard[combo[0]] == gameBoard[combo[1]] && gameBoard[combo[1]] == gameBoard[combo[2]])
               {
                
                if(gameBoard[combo[0]] == 1)
                {
                    print("Noughts have won")
                }
                else
                {
                    print("Crosses have one")
                }
                
                 gameActive = false
               }
                
            }
            sender.setImage(image, forState: .Normal)
            print(sender.tag)

        }
        
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

