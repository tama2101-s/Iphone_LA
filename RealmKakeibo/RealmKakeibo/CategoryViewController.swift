//
//  CategoryViewController.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import UIKit
import RealmSwift

class CategoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == UITableViewCell.EditingStyle.delete{
            do{
                try! realm.write{
                    realm.delete(self.categories[indexPath.row])
                }
            }catch{
                
            }
            categories = readCategories()
            tableView.reloadData()
        }
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
