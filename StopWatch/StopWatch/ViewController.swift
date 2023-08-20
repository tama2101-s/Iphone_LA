//
//  ViewController.swift
//  StopWatch
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    @IBOutlet var hanteilabel: UILabel!
    
    @IBOutlet var stop_button: UIButton!
    
    var count: Float = 0.0
    
    var timer: Timer = Timer()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func start(){
        
        if !timer.isValid{
            timer = Timer.scheduledTimer(timeInterval: 0.01,
                                         target: self,
                                         selector: #selector(self.up),
                                         userInfo: nil,
                                         repeats: true
            )
            hanteilabel.text = ""
        }
        
    }
    
    @IBAction func stop(){
        if timer.isValid{
            timer.invalidate()
            stop_button.setTitle("RESET", for: .normal)
            self.hantei()
        }else{
            label.text = "0.0"
            count = 0.0
            stop_button.setTitle("STOP", for: .normal)
            hanteilabel.text = ""
        }
    }
    
    @objc func up(){
        count = count + 0.01
        label.text = String(format: "%.2f", count)
    }
    
    @objc func hantei(){
        if count == 10.00{
            hanteilabel.text = "PERFECT!"
            
        }else if count >= 9.80 && count <= 10.20{
            hanteilabel.text = "GREAD!"
        }else if count >= 9.50 && count <= 10.50{
            hanteilabel.text = "GOOD!"
        }
    }


}

