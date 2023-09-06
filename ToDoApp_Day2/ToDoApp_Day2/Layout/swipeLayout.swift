//
//  swipeLayout.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/06.
//

import Foundation
import UIKit

class swipeLayout{
    func delete_layout(data: UIContextualAction){
        data.image = UIImage(systemName: "trash.fill")
        data.backgroundColor = .red
    }
    
    func edit_layout(data: UIContextualAction){
        data.image = UIImage(systemName: "pencil")
        data.backgroundColor = .blue
    }
    
}
