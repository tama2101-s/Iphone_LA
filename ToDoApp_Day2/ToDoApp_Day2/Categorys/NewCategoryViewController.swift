//
//  NewCategoryViewController.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import UIKit
import RealmSwift

class NewCategoryViewController: UIViewController {
    
    @IBOutlet var categoryTextField: UITextField!
    
    let realm = try! Realm()
    var selectMode = ""
    var selectCategory: Category = Category()
    var before_edit_category: Category = Category()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectMode == "E"{
            categoryTextField.text = selectCategory.title
            before_edit_category = selectCategory
        }

        // Do any additional setup after loading the view.
    }
    
    @IBAction func save(){
        let category = Category()
        category.title = categoryTextField.text ?? ""
        let results = self.realm.objects(ToDoItem.self).filter("category == %@", selectCategory)
        let category_results = self.realm.objects(Category.self).filter("title == %@", categoryTextField.text)
        
        if category_results.count > 0{
            let alert = UIAlertController(title: "重複エラー", message: "そのカテゴリーはすでに登録されています", preferredStyle: .alert)
            let ok = UIAlertAction(title: "OK", style: .default){
                (action) in
                self.dismiss(animated: true)
            }
            alert.addAction(ok)
            present(alert,animated: true, completion: nil)
        }else if selectMode == "A"{
            
            createCategory(category: category)
            self.dismiss(animated: true)
            
            
        } else if selectMode == "E"{
            category.id = selectCategory.id
            
            
            try! realm.write{
                realm.add(category,update: .modified)
                for result in results{
                    result.category = category
                }
            }
            self.dismiss(animated: true)
        }
        
        
        
    }
    
    @IBAction func cancel(){
        self.dismiss(animated: true)
    }
    
    func createCategory(category: Category){
        try! realm.write{
            realm.add(category)
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
