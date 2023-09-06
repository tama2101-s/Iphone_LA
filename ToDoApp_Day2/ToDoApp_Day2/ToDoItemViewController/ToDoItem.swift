//
//  ToDoItem.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/04.
//

import Foundation
import RealmSwift

class ToDoItem: Object{
    @Persisted var id = UUID()
    @Persisted var title: String = ""
    @Persisted var timeDate: String = ""
    @Persisted var item_discript: String = ""
    @Persisted var isMarked: Bool = false
    @Persisted var category: Category?
    
    override static func primaryKey() -> String? {
                return "id"
        }
    
}
