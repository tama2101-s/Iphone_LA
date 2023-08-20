//
//  ViewController.swift
//  Timer
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var label: UILabel!
    
    var timer: Timer!
    
    var countdown: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func set_timer(timer_count: Int){
        
        countdown = timer_count
        
        if timer != nil{
            timer.invalidate()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(onTimerCalled),
                                     userInfo: nil,
                                     repeats: true)
        timer.fire()
    }
    
    @objc func onTimerCalled(){
        
        updateLabel()
        
        countdown -= 1
        
        if countdown < 0 {
            showStopAlert()
            
            timer.invalidate()
        }
    }
    
    func updateLabel(){
        let remainingMinutes: Int = countdown / 60
        let remainingSeconds: Int = countdown % 60
        
        label.text = String(format: "%02d:%02d", remainingMinutes,remainingSeconds)
    }
    
    func showStopAlert(){
        let stopAlert = UIAlertController(title: "タイマーが終了しました", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        
        stopAlert.addAction(okAction)
        
        present(stopAlert, animated: true)
    }
    
    @IBAction func select30seconds(){
        set_timer(timer_count: 30)
    }
    
    @IBAction func select60seconds(){
        set_timer(timer_count: 60)
    }
    
    @IBAction func select300seconds(){
        set_timer(timer_count: 300)
    }
    
    @IBAction func select600seconds(){
        set_timer(timer_count: 600)
    }
    
    @IBAction func ResetButton(){
        if timer != nil{
            timer.invalidate()
            countdown = 0
            label.text = "00:00"
        }
    }


}

