//
//  ViewController.swift
//  1A2B
//
//  Created by Cid Hsieh on 2017/3/7.
//  Copyright © 2017年 Cid Hsieh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var answerView: UIView!
    
    @IBOutlet weak var inputNumber1: UITextField!
    @IBOutlet weak var inputNumber2: UITextField!
    @IBOutlet weak var inputNumber3: UITextField!
    @IBOutlet weak var inputNumber4: UITextField!
    
    @IBOutlet weak var informationOfA: UILabel!
    @IBOutlet weak var informationOfB: UILabel!
    @IBOutlet weak var gameStateTitle: UILabel!
    
    @IBOutlet weak var counter: UILabel!
    
    @IBAction func inputNumberEdit1(_ sender: UITextField) {
        inputNumber1.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
        inputNumber2.becomeFirstResponder()
        inputNumber1.isEnabled = false //讓使用者無法再輸入
    }
    @IBAction func inputNumberEdit2(_ sender: UITextField) {
        inputNumber2.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
        inputNumber3.becomeFirstResponder()
        inputNumber2.isEnabled = false
    }
    @IBAction func inputNumberEdit3(_ sender: UITextField) {
        inputNumber3.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
        inputNumber4.becomeFirstResponder()
        inputNumber3.isEnabled = false
    }
    @IBAction func inputNumberEdit4(_ sender: UITextField) {
        inputNumber4.backgroundColor = UIColor(red: 0/255, green: 255/255, blue: 255/255, alpha: 1)
        inputNumber4.isEnabled = false
    }
    @IBOutlet weak var randomNumber1: UITextField!
    @IBOutlet weak var randomNumber2: UITextField!
    @IBOutlet weak var randomNumber3: UITextField!
    @IBOutlet weak var randomNumber4: UITextField!
    
    
    var isWin:Bool! //設一個bool的變數控制遊戲結束時不能再按enterButton
    var gameIsContinue:Bool!
    let howToPlay = UILabel(frame: CGRect(x: 21, y: 120, width: 340 , height: 290)) //創出一個玩法說明的文字框
    let winningTable = UILabel(frame: CGRect(x: 21, y: 45, width: 340, height: 300))
    
    
    var oriRandomNumber: [Int] = []                 //設一個空陣列
    func randomNumber() {
        while oriRandomNumber.count < 4 {           //假設陣列成員數小於4，表示現有3個數，要再加入第四個
            var tmp: Int?                           //設一變數來暫存整數
            repeat {                                //用repeat while先跑一次
                tmp = Int(arc4random_uniform(10))   //取整數的 0 - 9 隨機數
            } while Set(oriRandomNumber).contains(tmp!) //當陣列中以含有與數暫存整數同樣的整數時，set.contains判定為true時，重頭再產生隨機數
            oriRandomNumber.append(tmp!)            //set.contains判定為false時，存入暫存整數到陣列中，接著再回到上面判定陣咧成員數的while loop
        }
    }
    
    var countingTimes = 0
    
    func clearOrRestart() {
        inputNumber1.text = ""
        inputNumber2.text = ""
        inputNumber3.text = ""
        inputNumber4.text = ""
        
        informationOfA.text = ""
        informationOfB.text = ""
        
        inputNumber1.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1)
        inputNumber2.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1)
        inputNumber3.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1)
        inputNumber4.backgroundColor = UIColor(red: 128/255, green: 255/255, blue: 0/255, alpha: 1)
        
        inputNumber1.isEnabled = true
        inputNumber2.isEnabled = true
        inputNumber3.isEnabled = true
        inputNumber4.isEnabled = true
        
        gameStateTitle.text = ""
        
        answerView.isHidden = false
        
        inputNumber1.becomeFirstResponder()
        
        isWin = false
        gameIsContinue = true
    }
    @IBAction func pressedEnter(_ sender: UIButton) {
        if isWin == true  { //如果是true就跳出不執行下列程式
            return
        }
        
        if inputNumber1.text == inputNumber2.text || inputNumber1.text == inputNumber3.text || inputNumber1.text == inputNumber4.text || inputNumber2.text == inputNumber3.text || inputNumber2.text == inputNumber4.text || inputNumber3.text == inputNumber4.text {
            gameStateTitle.text = "Enter 4 different numbers"
        } else if inputNumber1.text != "" && inputNumber2.text != "" && inputNumber3.text != "" && inputNumber4.text != "" {
        
            countingTimes += 1
            counter.text = "\(countingTimes)"
            print(countingTimes)
            
            winningTable.backgroundColor = UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 0.9)
            winningTable.textColor = UIColor.black
            winningTable.textAlignment = .center
            winningTable.font = .systemFont(ofSize: 40)
            winningTable.numberOfLines = 0 //設定自動換行
            winningTable.text = "You spent \(countingTimes) times to win, pressed restart to play new game"
            view.addSubview(winningTable)
            
            var A = 0
            var B = 0
            
            if Int((inputNumber1.text)!) == oriRandomNumber[0] {
                A += 1
            }else if Int(inputNumber1.text!)! == oriRandomNumber[1] || Int(inputNumber1.text!)! == oriRandomNumber[2] || Int(inputNumber1.text!)! == oriRandomNumber[3] {
                B += 1
            }
            if Int(inputNumber2.text!)! == oriRandomNumber[1] {
                A += 1
            }else if Int(inputNumber2.text!)! == oriRandomNumber[0] || Int(inputNumber2.text!)! == oriRandomNumber[2] || Int(inputNumber2.text!)! == oriRandomNumber[3] {
                B += 1
            }
            if Int(inputNumber3.text!)! == oriRandomNumber[2] {
                A += 1
            }else if Int(inputNumber3.text!)! == oriRandomNumber[1] || Int(inputNumber3.text!)! == oriRandomNumber[0] || Int(inputNumber3.text!)! == oriRandomNumber[3] {
                B += 1
            }
            if Int(inputNumber4.text!)! == oriRandomNumber[3] {
                A += 1
            }else if Int(inputNumber4.text!)! == oriRandomNumber[1] || Int(inputNumber4.text!)! == oriRandomNumber[2] || Int(inputNumber4.text!)! == oriRandomNumber[0] {
                B += 1
            }
            print("\(A), \(B)")
            
            switch A {
                case 0: informationOfA.text = "0A"; gameStateTitle.text = "You Are Wrong!!"
                    answerView.isHidden = true
                    isWin = true
                    gameIsContinue = true
                case 1: informationOfA.text = "1A"; gameStateTitle.text = "You Are Wrong!!"
                    answerView.isHidden = true
                    isWin = true
                    gameIsContinue = true
                case 2: informationOfA.text = "2A"; gameStateTitle.text = "You Are Wrong!!"
                    answerView.isHidden = true
                    isWin = true
                    gameIsContinue = true
                case 3: informationOfA.text = "3A"; gameStateTitle.text = "You Are Wrong!!"
                    answerView.isHidden = true
                    isWin = true
                    gameIsContinue = true
                default: informationOfA.text = "4A"
                    gameStateTitle.text = "You Are Win!!"
                    winningTable.isHidden = false
                    isWin = true //獲勝時改為true，再按enterButton也沒作用
                    gameIsContinue = false
                
            }
            switch B {
                case 0: informationOfB.text = "0B"
                case 1: informationOfB.text = "1B"
                case 2: informationOfB.text = "2B"
                case 3: informationOfB.text = "3B"
                default: informationOfB.text = "4B"
            }
                A = 0
                B = 0
                
            }else{
            gameStateTitle.text = "Please enter 4 number" //沒輸入任何數字會出現提示
        }
    }
    
    @IBAction func clearButton(_ sender: UIButton) {
        if gameIsContinue == false {
            return
        }
        clearOrRestart()
    }
    @IBAction func restartButton(_ sender: UIButton) {
      
        if oriRandomNumber.isEmpty == false{
            oriRandomNumber.removeAll()
            randomNumber()
            print(oriRandomNumber)
            
            clearOrRestart()
            
            countingTimes = 0
            counter.text = "0"
            winningTable.isHidden = true
            randomNumber1.text = "\(oriRandomNumber[0])"
            randomNumber2.text = "\(oriRandomNumber[1])"
            randomNumber3.text = "\(oriRandomNumber[2])"
            randomNumber4.text = "\(oriRandomNumber[3])"
        }
    }

    @IBOutlet weak var open: UISwitch!
    @IBAction func onpeManul(_ sender: UISwitch) {
        if open.isOn == true{
            howToPlay.isHidden = false
        }else{
            howToPlay.isHidden = true
        }
    }
    @IBAction func slidedToSeeAnswer(_ sender: UISlider) {
        let alpha = (sender.value)
        randomNumber1.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(alpha))
        randomNumber2.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(alpha))
        randomNumber3.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(alpha))
        randomNumber4.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(alpha))
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomNumber()
        isWin = false
        gameIsContinue = true

        randomNumber1.text = "\(oriRandomNumber[0])"
        randomNumber2.text = "\(oriRandomNumber[1])"
        randomNumber3.text = "\(oriRandomNumber[2])"
        randomNumber4.text = "\(oriRandomNumber[3])"
        
        randomNumber1.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(0))
        randomNumber2.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(0))
        randomNumber3.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(0))
        randomNumber4.textColor = UIColor(displayP3Red: 102/255, green: 102/255, blue: 102/255, alpha: CGFloat(0))
        
        print(oriRandomNumber)
        inputNumber1.becomeFirstResponder()
        
        open.isOn = false //switch開關預設為關閉
        
        howToPlay.backgroundColor = UIColor(red: 255/255, green: 128/255, blue: 0/255, alpha: 0.85)
        howToPlay.textColor = UIColor.darkGray
        howToPlay.textAlignment = .center
        howToPlay.font = .systemFont(ofSize: 28)
        howToPlay.numberOfLines = 0 //設定自動換行
        howToPlay.text = "現在電腦已想好了一個4位數(數字0~9且不重複)請你猜猜看, 猜完後會給你一個提示, 例如:1A2B, 表示其中有1個數字不但猜對, 位置也正確, 另有2個數字被猜中, 但位置不正確, 請用最少的次數把這個數猜出來吧 !"
        view.addSubview(howToPlay)
        howToPlay.isHidden = true
        winningTable.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let loadingAlert = UIAlertController(title: "警告", message: "糖尿病、心臟病、高血壓患者及孕婦請立刻按Home鍵退出，其餘人士請小心使用", preferredStyle: .alert)
        loadingAlert.addAction(UIAlertAction(title: "我知道了", style: .default, handler: nil))
        present(loadingAlert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

