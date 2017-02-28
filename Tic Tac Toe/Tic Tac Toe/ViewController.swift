//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Cid Hsieh on 2017/2/28.
//  Copyright © 2017年 Cid Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    var activePlayer = 1 //croee
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    @IBAction func action(_ sender: AnyObject)
    {
        if gameState[sender.tag - 1] == 0
        {
            gameState[sender.tag - 1] = activePlayer
            
            if activePlayer == 1
            {
                sender.setImage(UIImage(named: "Cross.png"), for: UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "Circle.png"), for: UIControlState())
                activePlayer = 1
            }
        
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

