//
//  Category.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/04.
//

import Foundation
import RealmSwift

class Category:Object{
    @Persisted var id = UUID()
    @Persisted var title: String = ""
    override static func primaryKey() -> String? {
        return "id"
    }
}
