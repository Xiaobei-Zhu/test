//
//  OptionalSurveyTableViewCell.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/3.
//

import UIKit

class OptionalSurveyTableViewCell: UITableViewCell {


    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var TypeLabel: UILabel!
    @IBOutlet var ReasonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
