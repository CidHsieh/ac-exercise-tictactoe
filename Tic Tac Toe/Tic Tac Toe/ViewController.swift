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

    @IBAction func action(_ sender: AnyObject)
    {
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
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

