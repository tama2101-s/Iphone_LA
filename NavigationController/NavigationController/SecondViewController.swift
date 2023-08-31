//
//  SecondViewController.swift
//  NavigationController
//
//  Created by 田丸翔大 on 2023/08/31.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(){
        navigationController?.popViewController(animated: true)
    }

}
