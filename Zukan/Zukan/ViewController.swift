//
//  ViewController.swift
//  Zukan
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var detailsLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var animalArray: [Animal] = [
        Animal(name: "キリン", details: "キリンの仲間は全てアフリカ大陸に分布していて、地上でもっとも背の高い動物としてよく知られている。", imageName: "kirin"),
        Animal(name: "オウサマペンギン", details: "南極をとりまく亜南極圏の島々にすむ。巣はつくらず、両足の上に卵をのせ、ひだのようになった腹部の皮（抱卵のう）で包みこむ。", imageName: "penguin"),
        Animal(name: "カンガルー", details: "発達した後足と長くて丈夫な尾をもつ特徴的な体をしていて、有袋類の中では最も体が大きい。", imageName: "kangaroo")
        
    ]
    
    var index: Int = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUI()
    }
    
    @IBAction func next(){
        if index == animalArray.count - 1{
            index = 0
        } else {
            index += 1
        }
        
        setUI()
        
    }
    
    @IBAction func back(){
        if index == 0{
            index = animalArray.count - 1
        }else{
            index -= 1
        }
        
        setUI()
        
    }
    
    func setUI(){
        imageView.image = animalArray[index].getImage()
        nameLabel.text = animalArray[index].name
        detailsLabel.text = animalArray[index].details
    }


}

