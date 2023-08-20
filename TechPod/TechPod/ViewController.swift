//
//  ViewController.swift
//  TechPod
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var table:UITableView!
    
    var songNameArray = [String]()
    
//    曲のファイルを入れるための配列
    var fileNameArray = [String]()
    
//    音楽家の画像を入れるための配列
    var imageNameArray = [String]()
    
//    音楽を再生するための変数
    var audioPlayer: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.dataSource = self
        
        table.delegate = self
        
        songNameArray = ["カノン", "エリーゼのために", "G線上のアリア"]
        
        fileNameArray = ["cannon", "elise", "aria"]
        
        imageNameArray = ["Pachelbel.jpg", "Beethoven.jpg", "Bach.jpg"]
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(songNameArray[indexPath.row])が選択されました")
        
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        audioPlayer.play()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
//        セル付属のimageViewに音楽家の画像を表示する
        cell?.imageView?.image = UIImage(named: imageNameArray[indexPath.row])
        
        return cell!
    }


}

