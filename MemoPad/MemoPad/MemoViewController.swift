//
//  MemoViewController.swift
//  MemoPad
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class MemoViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentTextView: UITextView!
    
    var saveData: UserDefaults = UserDefaults.standard
    

    override func viewDidLoad() {
        super.viewDidLoad()
        titleTextField.text = saveData.object(forKey: "title") as? String
        
        contentTextView.text = saveData.object(forKey: "content") as? String
        // Do any additional setup after loading the view.
        
        titleTextField.delegate = self
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func saveMemo(_ sender: UIBarButtonItem){
        
        saveData.set(titleTextField.text, forKey: "title")
        saveData.set(contentTextView.text, forKey: "content")
        
        let alert: UIAlertController = UIAlertController(title: "保存", message: "メモの保存が完了しました", preferredStyle: .alert)
        
        alert.addAction(
            UIAlertAction(title: "OK",
                          style: .default,
                         handler: {
                             action in
                             self.navigationController?.popViewController(animated: true)
                             print("OKボタンが押されました")
                         }
            )
        )
        present(alert,animated: true, completion: nil)
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
