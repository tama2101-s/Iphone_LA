//
//  blind10ViewController.swift
//  Count_testing
//
//  Created by 田丸翔大 on 2023/08/28.
//

import UIKit

class blind10ViewController: UIViewController {
    
    @IBOutlet var count:UILabel!
    
    var members: Int?
    
    var num:Int = 0
    
    var array:[Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plus(){
        if num == 10{
            num = 0
        }else{
            num += 1
        }
        
        
        print(num)
        count.text = String(num)
    }
    
    @IBAction func  confirm(){
        
        array.append(num)
        count.text = String(0)
        num = 0
        
        if array.count == members{
            performSegue(withIdentifier: "Resultview", sender: nil)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Resultview"{
            let secondView = segue.destination as! resultViewController
            secondView.resultArray = self.array
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
