//
//  CategoryViewController.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet var tableview: UITableView!
    
    
    let realm = try! Realm()
    var categories: [Category] = []
    var selectedCategory: Category? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableview.dataSource = self
        tableview.delegate = self
        categories = readCategories()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        categories = readCategories()
        tableview.reloadData()
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell")!
        cell.textLabel?.text = categories[indexPath.row].title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedCategory = categories[indexPath.row]
        self.performSegue(withIdentifier: "toItemView", sender: nil)
    }
    
    func readCategories() -> [Category] {
        return Array(realm.objects(Category.self))
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toItemView"{
            let itemViewController = segue.destination as! ItemViewController
            itemViewController.selectedCategory = self.selectedCategory!
            
        } else if segue.identifier == "CategoryEditMode"{
            let EditCategoryController = segue.destination as! NewCategoryViewController
            EditCategoryController.selectMode = "E"
            EditCategoryController.selectCategory = self.selectedCategory!
            
        } else if segue.identifier == "toNewCategoryView"{
            let addCategoryController = segue.destination as! NewCategoryViewController
            addCategoryController.selectMode = "A"
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

extension CategoryViewController: UITableViewDelegate {
  // スワイプした時に表示するアクションの定義
  func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

    // 編集処理
    let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
      // 編集処理を記述
        self.selectedCategory = self.categories[indexPath.row]
        self.performSegue(withIdentifier: "CategoryEditMode", sender: nil)

    // 実行結果に関わらず記述
    completionHandler(true)
    }
      
      swipeLayout().edit_layout(data:editAction)

   // 削除処理
    let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
      //削除処理を記述
        do{
            
            try! self.realm.write{
                self.realm.delete(self.realm.objects(ToDoItem.self).filter("category == %@", self.categories[indexPath.row]))
                self.realm.delete(self.categories[indexPath.row])
                
            }
        }catch{
            
        }
        self.categories = self.readCategories()
        self.tableview.reloadData()

      // 実行結果に関わらず記述
      completionHandler(true)
    }
      
      swipeLayout().delete_layout(data:deleteAction)

    // 定義したアクションをセット
    return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
  }
}
