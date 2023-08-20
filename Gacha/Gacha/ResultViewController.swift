//
//  ResultViewController.swift
//  Gacha
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ResultViewController: UIViewController {
//    乱数を入れるためのInt型の変数を用意
    var number: Int!
    var character_number: Int!
    
    let character_SSR: [String] = ["minecraft","unity","iphone"]
    
    let character_SR: [String] = ["android","webDesign","webService","mediaArt","animation","movie"]
    
    let character_N: [String] = ["camera","2DGame","designer","line","maya","IoTMesh"]
    
//    背景画像とモンスターの画像を表示するためのImageViewを用意
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var characterImageView: UIImageView!
    
    @IBOutlet var character_name: UILabel!
    @IBOutlet var character_rare: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        number = Int.random(in: 0...9)
        
        if number == 9{
            character_number = Int.random(in: 0..<character_SSR.count)
            characterImageView.image = UIImage(named: character_SSR[character_number])

            backgroundImageView.image = UIImage(named: "bgBlue")
            character_name.text = character_SSR[character_number]
            character_rare.text = "SSR"
            
        }else if number >= 7{
            character_number = Int.random(in: 0..<character_SR.count)
            characterImageView.image = UIImage(named: character_SR[character_number])

            backgroundImageView.image = UIImage(named: "bgGreen")
            character_name.text = character_SR[character_number]
            character_rare.text = "SR"
        }else{
            character_number = Int.random(in: 0..<character_N.count)
            characterImageView.image = UIImage(named: character_N[character_number])

            backgroundImageView.image = UIImage(named: "bgRed")
            character_name.text = character_N[character_number]
            character_rare.text = "N"
        }
        
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.characterImageView.center = self.view.center
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseIn, .autoreverse, .repeat], animations: {
            self.characterImageView.center.y += 10.0
        }) { _ in
            self.characterImageView.center.y -= 10.0
            
        }
    }
    
    @IBAction func back(){
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
