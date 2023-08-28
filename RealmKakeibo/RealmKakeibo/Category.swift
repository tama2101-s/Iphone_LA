//
//  Category.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import Foundation
import RealmSwift

class Category: Object {
    @Persisted var title: String = ""
}
