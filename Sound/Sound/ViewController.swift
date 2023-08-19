//
//  ViewController.swift
//  Sound
//
//  Created by 田丸翔大 on 2023/08/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    ドラムを表示する箱を作る
    @IBOutlet var drumButton: UIButton!
    
//    ドラムのサウンドファイルを読み込んで、プレイヤーをつくる
    let drumSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "drumSound")!.data)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchDownDrumButton(){
//        ドラムが鳴っている画像に切り替える
        drumButton.setImage(UIImage(named: "drumPlayingImage"), for: .normal)
        drumSoundPlayer.currentTime = 0
        
        drumSoundPlayer.play()
        
    }
    
//    ドラムボタンの上でタッチが終わるときに呼ばれる
    @IBAction func touchUpDrumButton(){
        
        drumButton.setImage(UIImage(named: "drumImage"), for: .normal)
        
    }


}

