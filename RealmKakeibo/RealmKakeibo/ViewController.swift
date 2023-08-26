//
//  ViewController.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDataSource {
    @IBOutlet var tableview: UITableView!
    
    
    let realm = try! Realm()
    var items: [ShoppingItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableview.dataSource = self
        tableview.register(UINib(nibName: "ItemTableViewCell", bundle: nil), forCellReuseIdentifier: "ItemCell")
        items = readItem()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        items = readItem()
        tableview.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemTableViewCell
        let item: ShoppingItem = items[indexPath.row]
        cell.setCell(title: item.title, price: item.price, isMarked: item.isMarked)
        
        return cell
    }
    
    func readItem() -> [ShoppingItem] {
        return Array(realm.objects(ShoppingItem.self))
    }


}

