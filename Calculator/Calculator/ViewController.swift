//
//  ViewController.swift
//  Calculator
//
//  Created by 田丸翔大 on 2023/08/18.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var calcLabel: UILabel!
    
    var number1: Int = 0
    var number2: Int = 0
    var number3: Int = 0
    var is_twotime: Int = 0
    
    var ope: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func selecters(number:Int){
        number1 = number1*10 + number
        label.text = String(number1)
    }
    
    func calcs(calc:Int){
        is_twotime+=1
        if is_twotime == 2{
            equal()
            is_twotime = 1
        }
            
        number2 = number1
        number1 = 0
        ope = calc
        if ope == 1{
            calcLabel.text = "+"
        } else if ope == 2{
            calcLabel.text = "-"
        } else if ope == 3{
            calcLabel.text = "×"
        } else if ope == 4{
            calcLabel.text = "÷"
        }
        
        
    }
    
    @IBAction func select3() {
        selecters(number: 3)
    }
    
    @IBAction func select4(){
        selecters(number: 4)
    }
    
    @IBAction func select0(){
        selecters(number: 0)
    }
    
    @IBAction func select1(){
        selecters(number: 1)
    }
    
    @IBAction func select2(){
        selecters(number: 2)
    }
    
    @IBAction func select5(){
        selecters(number: 5)
    }
    
    @IBAction func select6(){
        selecters(number: 6)
    }
    
    @IBAction func select7(){
        selecters(number: 7)
    }
    
    @IBAction func select8(){
        selecters(number: 8)
        
    }
    
    @IBAction func select9(){
        selecters(number: 9)
    }
    
    
    @IBAction func plus(){
        calcs(calc: 1)
    }
    
    @IBAction func minus(){
        calcs(calc: 2)
    }
    
    @IBAction func times(){
        calcs(calc: 3)
    }
    
    @IBAction func division(){
        calcs(calc: 4)
    }
    
    
    @IBAction func equal(){
        if ope == 1{
            number3 = number2 + number1
        } else if ope == 2{
            number3 = number2 - number1
        } else if ope == 3{
            number3 = number2 * number1
        } else if ope == 4{
            number3 = number2 / number1
        }
        
        label.text = String(number3)
        calcLabel.text = ""
        number1 = number3
        number2 = 0
    }
    
    @IBAction func cleared(){
        number3 = 0
        label.text = String(number3)
        number1 = 0
        number2 = 0
    }
    
    
    
    
    
}

