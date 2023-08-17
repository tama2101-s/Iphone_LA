//
//  ViewController.swift
//  Count
//
//  Created by 田丸翔大 on 2023/08/17.
//

import UIKit

class ViewController: UIViewController {
    
    var number: Int = 0
    
    @IBOutlet var label: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func ifnumber(){
        if number > 10{
            label.textColor = UIColor.red
        } else if number <= -10{
            label.textColor = UIColor.blue
        }else{
            label.textColor = UIColor.black
        }
    }
    
    @IBAction func plus(){
        number += 1
        label.text = String(number)
        
        ifnumber()
        
    }
    
    @IBAction func minus(){
        number -= 1
        label.text = String(number)
        
        ifnumber()
    }


}

