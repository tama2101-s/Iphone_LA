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
    
//    ピアノを表示する箱を作る
    @IBOutlet var pianoButton: UIButton!
//    ギターを表示する箱を作る
    @IBOutlet var guitarButton: UIButton!
    
//    ドラムのサウンドファイルを読み込んで、プレイヤーをつくる
    let drumSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "drumSound")!.data)
    
//    ピアノのサウンドファイルを読み込んで、プレイヤーを作る
    let pianoSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "pianoSound")!.data)
//    ピアノのサウンドファイルを読み込んで、プレイヤーを作る
    let guitarSoundPlayer = try!AVAudioPlayer(data: NSDataAsset(name: "guitarSound")!.data)

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
    
    @IBAction func touchDownPianoButton(){
//        ドラムが鳴っている画像に切り替える
        pianoButton.setImage(UIImage(named: "pianoPlayingImage"), for: .normal)
        pianoSoundPlayer.currentTime = 0
        
        pianoSoundPlayer.play()
        
    }
    
    @IBAction func touchUpPianoButton(){
        pianoButton.setImage(UIImage(named: "pianoImage"), for: .normal)
    }
    
    @IBAction func touchDownGuitarButton(){
//        ギターが鳴っている画像に切り替える
        guitarButton.setImage(UIImage(named: "guitarPlayingImage"), for: .normal)
        guitarSoundPlayer.currentTime = 0
        
        guitarSoundPlayer.play()
        
    }
    
    @IBAction func touchUpGuitarButton(){
        guitarButton.setImage(UIImage(named: "guitarImage"), for: .normal)
    }


}

