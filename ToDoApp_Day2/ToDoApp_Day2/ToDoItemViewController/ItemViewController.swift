//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import UIKit
import RealmSwift

class ItemViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableview: UITableView!
    
    
    let realm = try! Realm()
    var items: [ToDoItem] = []
    var selectedCategory: Category!
    var edit_data: ToDoItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItem()
        navigationItem.title = selectedCategory.title
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItem()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        edit_data  = self.items[indexPath.row]
        
        self.performSegue(withIdentifier: "Show_item", sender: nil)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ToDoItem = items[indexPath.row]
        cell.setCell(title: item.title, timeDate: item.timeDate, isMarked: item.isMarked)
        
        return cell
    }
    
    
    
    func readItem() -> [ToDoItem] {
        return Array(realm.objects(ToDoItem.self).filter("category == %@", selectedCategory))
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toNewItemView"{
            let newItemViewController = segue.destination as! NewItemViewController
            newItemViewController.category = self.selectedCategory
            newItemViewController.segue_name = "toNewItemView"
            
        }else if segue.identifier == "EditMode"{
            print("Editするよ")
            let editItemViewController = segue.destination as! NewItemViewController
            editItemViewController.category = self.selectedCategory
            editItemViewController.segue_name = "EditMode"
            editItemViewController.item_edit = edit_data
        } else if segue.identifier == "Show_item"{
            let showItemViewController = segue.destination as! ShowItemViewController
            showItemViewController.item = edit_data
        }
    }
    
    
}

extension ItemViewController: UITableViewDelegate {
    // スワイプした時に表示するアクションの定義
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        // 編集処理
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (action, view, completionHandler) in
            // 編集処理を記述
            print("Editがタップされた")
            print(self.items[indexPath.row])
            self.edit_data = self.items[indexPath.row]
            self.performSegue(withIdentifier: "EditMode", sender: nil)
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        swipeLayout().edit_layout(data: editAction)
        
        // 削除処理
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (action, view, completionHandler) in
            //削除処理を記述
            do{
                
                try! self.realm.write{
                    self.realm.delete(self.items[indexPath.row])
                }
            }catch{
                
            }
            self.items = self.readItem()
            self.tableview.reloadData()
            
            // 実行結果に関わらず記述
            completionHandler(true)
        }
        swipeLayout().delete_layout(data: deleteAction)
        
        // 定義したアクションをセット
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
}



//
//  ViewController.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/04.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
}

