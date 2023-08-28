//
//  ViewController.swift
//  Count_testing
//
//  Created by 田丸翔大 on 2023/08/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var background: UIImageView!
    
    var num: Int = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backhome(){
        dismiss(animated: true)
    }
    
    @IBAction func plus(){
        if num == 23{
            num = 0
        }else {
            num += 1
        }
        
        if 10 <= num && num <= 16 {
            background.image = UIImage(named: "noon")
        }else if 6 <= num && num <= 18{
            background.image = UIImage(named: "sunrise")
        }else{
            background.image = UIImage(named: "night")
        }
        
        label.text = "\(num)時"
    }
    
    @IBAction func minus(){
        if num == 0{
            num = 23
        }else{
            num -= 1
        }
        
        if 10 <= num && num <= 16 {
            background.image = UIImage(named: "noon")
        }else if 6 <= num && num <= 18{
            background.image = UIImage(named: "sunrise")
        }else{
            background.image = UIImage(named: "night")
        }
        
        label.text = "\(num)時"
    }


}

