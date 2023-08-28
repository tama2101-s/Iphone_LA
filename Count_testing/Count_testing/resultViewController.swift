//
//  resultViewController.swift
//  Count_testing
//
//  Created by 田丸翔大 on 2023/08/28.
//

import UIKit

class resultViewController: UIViewController {
    
    @IBOutlet var results: UILabel!
    @IBOutlet var result_array: UILabel!
    
    var resultText = ""
    var result_array_text = ""
    
    var resultArray: [Int] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let uniqueNumbers = Array(Set(resultArray))
        if uniqueNumbers.count == 1{
            resultText = "一致！！"
        }else{
            resultText = "一致ならず…"
        }
        
        for (i, values) in resultArray.enumerated(){
            result_array_text += "\(i+1)人目　\(values) \n"
        }
        print(result_array_text)
        
        results.text = resultText
        result_array.text = result_array_text

        // Do any additional setup after loading the view.
    }
    
    @IBAction func doneButtonTapped(){
        self.presentingViewController?.presentingViewController?.presentingViewController?.dismiss(animated: true, completion: nil)
        
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
