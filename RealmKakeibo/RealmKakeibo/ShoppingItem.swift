//
//  Shoppingtem.swift
//  RealmKakeibo
//
//  Created by 田丸翔大 on 2023/08/26.
//

import Foundation
import RealmSwift

class ShoppingItem: Object{
    
    @Persisted var title: String = ""
    @Persisted var price: Int = 0
    @Persisted var isMarked: Bool = false
    
}
