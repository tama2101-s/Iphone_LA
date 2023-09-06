//
//  NewItemViewController.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/04.
//

import UIKit
import RealmSwift

class NewItemViewController: UIViewController {

    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var DateTimeTextField: UIDatePicker!
    @IBOutlet var discriptTextField: UITextField!
    @IBOutlet var markSwitch: UISwitch!
    
    var segue_name = ""
    
    let realm = try! Realm()
    var category: Category!
    var item_edit: ToDoItem?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if segue_name == "EditMode"{
            titleTextField.text = item_edit?.title
            DateTimeTextField.date = DateUtils.dateFromString(string: item_edit!.timeDate, format: "yyyy/MM/dd HH:mm:ss")
            discriptTextField.text = item_edit?.item_discript
            if item_edit!.isMarked{
                markSwitch.isOn = true
            }else{
                markSwitch.isOn = false
            }
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        let item = ToDoItem()
        item.title = titleTextField.text ?? ""
        item.timeDate = formatter.string(from: DateTimeTextField.date)
        item.item_discript = discriptTextField.text ?? ""
        item.isMarked = markSwitch.isOn
        item.category = category
        
        if segue_name == "toNewItemView"{
            createItem(item: item)
            
        }else if segue_name == "EditMode"{
            item.id = item_edit!.id
            
            try! realm.write{
                realm.add(item,update: .modified)
            }
        }
        
        
        self.dismiss(animated: true)
    }
    
    @IBAction func canceled(){
        self.dismiss(animated: true)
    }
    
    func createItem(item: ToDoItem){
        try! realm.write{
            realm.add(item)
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



