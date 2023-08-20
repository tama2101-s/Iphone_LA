//
//  Animal.swift
//  Zukan
//
//  Created by 田丸翔大 on 2023/08/20.
//

import UIKit

class Animal{
    var name: String
    var details: String
    var imageName: String
    
    init(name: String, details: String, imageName: String) {
        self.name = name
        self.details = details
        self.imageName = imageName
    }
    
    func getImage() -> UIImage{
        return UIImage(named: imageName)!
    }
    
}
