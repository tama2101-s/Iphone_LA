//
//  ShowItemViewController.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/05.
//

import UIKit

class ShowItemViewController: UIViewController {
    @IBOutlet var title_: UILabel!
    @IBOutlet var date: UILabel!
    @IBOutlet var time: UILabel!
    @IBOutlet var discript: UILabel!
    @IBOutlet var is_warning: UILabel!
    
    
    var item: ToDoItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        var time_date = DateUtils.dateFromString(string: item.timeDate, format: "yyyy/MM/dd HH:mm:ss")
        var date_data = DateUtils.stringFromDate(date: time_date, format: "yyyy年MM月dd日")
        var time_data = DateUtils.stringFromDate(date: time_date, format: "HH時mm分")
        
        
        title_.text = item.title
        date.text = date_data
        time.text = time_data
        discript.text = item.item_discript
        if time_date < Date(){
            title_.textColor = UIColor.red
            is_warning.text = "期限が過ぎています！！"
            is_warning.textColor = UIColor.red
        }
        

        // Do any additional setup after loading the view.
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
