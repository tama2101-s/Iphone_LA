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
    @IBOutlet var background: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func ifnumber(){
        if number > 10{
            label.textColor = UIColor.red
            background.image = UIImage(named: "noon")
            
        } else if number <= -10{
            label.textColor = UIColor.blue
            background.image = UIImage(named: "night")
        }else{
            label.textColor = UIColor.black
            background.image = UIImage(named: "sunrise")
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

