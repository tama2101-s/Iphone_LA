//
//  ViewController.swift
//  ItsuDareGame
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var itsuLabel: UILabel!
    @IBOutlet var dokodeLabel: UILabel!
    @IBOutlet var daregaLabel: UILabel!
    @IBOutlet var doshitaLabel: UILabel!
    
    @IBOutlet var changeButton:UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var randomButton: UIButton!
    
    
    let itsuArray: [String] = ["1年前", "1周間前", "昨日", "今日","明日", "来週"]
    let dokodeArray: [String] = ["山の上で", "アメリカで", "学校で", "クラスで","日本で", "海の家で"]
    let daregaArray: [String] = ["僕が", "大統領が", "先生が", "友達が", "親が", "親戚が"]
    let doshitaArray: [String] = ["叫んだ", "演説した", "怒った", "踊った", "歌った", "寝た"]
    
    var index: Int = 0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        changeButton.layer.cornerRadius = 35
        resetButton.layer.cornerRadius = 35
        randomButton.layer.cornerRadius = 35
        
        itsuLabel.layer.cornerRadius = 12
        dokodeLabel.layer.cornerRadius = 12
        daregaLabel.layer.cornerRadius = 12
        doshitaLabel.layer.cornerRadius = 12
        
        
        itsuLabel.clipsToBounds = true
        dokodeLabel.clipsToBounds = true
        daregaLabel.clipsToBounds = true
        doshitaLabel.clipsToBounds = true
        
    }
    
    @IBAction func change(){
        itsuLabel.text = itsuArray[index]
        dokodeLabel.text = dokodeArray[index]
        daregaLabel.text = daregaArray[index]
        doshitaLabel.text = doshitaArray[index]
        
        index += 1
        
        if index == itsuArray.count-1 {
            index = 0
        }else{
            index = index + 1
        }
        
    }
    
    @IBAction func reset(){
        itsuLabel.text = "----"
        dokodeLabel.text = "----"
        daregaLabel.text = "----"
        doshitaLabel.text = "----"
        
        
        index = 0
    }
    
    @IBAction func random(){
        let itsuIndex = Int.random(in: 0...itsuArray.count - 1)
        let dokodeIndex = Int.random(in: 0...dokodeArray.count - 1)
        let daregaIndex = Int.random(in: 0...daregaArray.count - 1)
        let doshitaIndex = Int.random(in: 0...doshitaArray.count - 1)
        
        
        print("いつ: \(itsuIndex)")
        print("どこで: \(dokodeIndex)")
        print("だれが: \(daregaIndex)")
        print("どうした: \(doshitaIndex)")
        
        
        itsuLabel.text = itsuArray[itsuIndex]
        dokodeLabel.text = dokodeArray[dokodeIndex]
        daregaLabel.text = daregaArray[daregaIndex]
        doshitaLabel.text = doshitaArray[doshitaIndex]
        
    }


}

