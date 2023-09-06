//
//  ItemTableViewCell.swift
//  ToDoApp_Day2
//
//  Created by 田丸翔大 on 2023/09/04.
//

import UIKit

class DateUtils {
    class func dateFromString(string: String, format: String) -> Date {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.date(from: string)!
    }

    class func stringFromDate(date: Date, format: String) -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var timedata: UILabel!
    @IBOutlet var markImageView: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(title:String, timeDate: String, isMarked: Bool){
        titleLabel.text = title
        let date = DateUtils.dateFromString(string: timeDate, format: "yyyy/MM/dd HH:mm:ss")
        if date < Date(){
            titleLabel.textColor = UIColor.red
        }else{
            titleLabel.textColor = UIColor.black
        }
        let datetoS = DateUtils.stringFromDate(date: date, format: "MM/dd")
        timedata.text = datetoS
        
        if isMarked {
            markImageView.image = UIImage(systemName: "star.fill")
        }else{
            markImageView.image = UIImage(systemName: "star")
        }
    }
    
}


