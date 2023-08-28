//
//  ChoosememberViewController.swift
//  Count_testing
//
//  Created by 田丸翔大 on 2023/08/28.
//

import UIKit

class ChoosememberViewController: UIViewController {
    
    var member: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func twomemberAct(){
        member = 2
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func threememberAct(){
        member = 3
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    @IBAction func fourmemberAct(){
        member = 4
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next"{
            let secondView = segue.destination as! blind10ViewController
            secondView.members = self.member
        }
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
