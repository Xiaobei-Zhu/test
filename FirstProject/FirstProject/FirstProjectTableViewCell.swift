//
//  FirstProjectTableViewCell.swift
//  FirstProject
//
//  Created by Xiaobei Zhu on 2020/12/18.
//

import UIKit

class FirstProjectTableViewCell: UITableViewCell {

    @IBOutlet var ImageView: UIImageView!
    @IBOutlet var NameLabel:UILabel!
    @IBOutlet var LocationLabel:UILabel!
    @IBOutlet var TypeLabel:UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
