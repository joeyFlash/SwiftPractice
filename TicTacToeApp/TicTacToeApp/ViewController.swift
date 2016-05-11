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
    
    var turn = 0
    
    @IBOutlet var gameOverLabel: UILabel!
    
    @IBOutlet var playAgainButton: UIButton!
    
    @IBAction func playAgainButtonPressed(sender: AnyObject)
    {
        activePlayer = 1
        
        gameActive = true
        
        gameBoard = [0,0,0,0,0,0,0,0,0]
        
        turn = 0
        
        var button : UIButton
        
        for i in 0 ..< 9
        {
            button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, forState: .Normal)
        }
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x-400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }
    
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
                
                var labelText = "Noughts has won"
                
                if(gameBoard[combo[0]] == 2)
                {
                    labelText = "Crosses has won"
                }
                
                gameOverLabel.text = labelText
                
                gameOverLabel.hidden = false
                playAgainButton.hidden = false
                
                UIView.animateWithDuration(0.5, animations: {
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x+400, self.gameOverLabel.center.y)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x+400, self.playAgainButton.center.y)
                })
                
                 gameActive = false
               }
                
            }
            
            turn += 1
            if(turn == 9 && gameActive)
            {
                gameOverLabel.text = "CATS!"
                gameOverLabel.hidden = false
                playAgainButton.hidden = false
                
                UIView.animateWithDuration(0.5, animations: {
                    self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x+400, self.gameOverLabel.center.y)
                    
                    self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x+400, self.playAgainButton.center.y)
                })
                
                gameActive = false
            }
            sender.setImage(image, forState: .Normal)
            print(sender.tag)

        }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameOverLabel.hidden = true
        playAgainButton.hidden = true
        
        gameOverLabel.center = CGPointMake(gameOverLabel.center.x-400, gameOverLabel.center.y)
        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLayoutSubviews()
    {
        super.viewDidLayoutSubviews()
//        gameOverLabel.center = CGPointMake(gameOverLabel.center.x-400, gameOverLabel.center.y)
//        playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    }
}

