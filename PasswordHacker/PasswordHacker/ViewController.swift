//
//  ViewController.swift
//  PasswordHacker
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var resultLabel1: UILabel!
    @IBOutlet var resultLabel2: UILabel!
    @IBOutlet var resultLabel3: UILabel!
    @IBOutlet var resultLabel4: UILabel!
    
    
//    カウント表示用ラベル
    @IBOutlet var countLabel: UILabel!
    
//    秘密のパスワード
    var password:Int = 4358
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func start(){
        countLabel.text = "推論中..."
        for i in 0...9999{
            
            
            RunLoop.main.run(until: Date(timeIntervalSinceNow: 0.0005))
            
            if i == password{
                
                var digits = [Int]()
                
                for _ in 0...3{
                    digits.append(password % 10)
                    password = password / 10
                }
                
                resultLabel1.text = String(digits[0])
                resultLabel2.text = String(digits[1])
                resultLabel3.text = String(digits[2])
                resultLabel4.text = String(digits[3])
                
                countLabel.text = "推論結果:パスワードは\(i)です"
                
                break
            }
        }
        
    }
    
    @IBAction func reset(){
        password = 4358
        
        countLabel.text = "STARTボタンを押して解析開始"
        
        resultLabel1.text = "0"
        resultLabel2.text = "0"
        resultLabel3.text = "0"
        resultLabel4.text = "0"
        
    }


}

