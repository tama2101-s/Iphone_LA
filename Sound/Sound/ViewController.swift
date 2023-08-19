//
//  ViewController.swift
//  Sound
//
//  Created by 田丸翔大 on 2023/08/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    ドラムのサウンドファイルを読み込んで、プレイヤーをつくる
    let drumSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "drumSound")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func tapDrumButton(){
        
        drumSoundPlayer.currentTime = 0
        
        drumSoundPlayer.play()
        
    }


}

