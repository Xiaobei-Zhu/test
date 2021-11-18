//
//  SearchTableViewCell.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/5.
//

import UIKit

class SearchTableViewCell: UITableViewCell {


    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
