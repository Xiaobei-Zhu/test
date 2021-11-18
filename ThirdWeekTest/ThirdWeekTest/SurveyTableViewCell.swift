//
//  SurveyTableViewCell.swift
//  ThirdWeekTest
//
//  Created by Xiaobei Zhu on 2020/12/21.
//

import UIKit

class SurveyTableViewCell: UITableViewCell {

    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var typeLable: UILabel!
    @IBOutlet var reasonLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
