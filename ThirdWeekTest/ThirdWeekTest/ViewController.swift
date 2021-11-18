//
//  ViewController.swift
//  ThirdWeekTest
//
//  Created by Xiaobei Zhu on 2020/12/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let surveyImage = ["11 5.png", "22 1.png", "33 3.png", "44 1.png"]
    let selectSurveyImage = ["11 3.png", "Page 9.png", "33 1.png", "Page 10.png"]
    let surveyType = ["Vacation", "Explorer", "Jetsetter", "Nomad"]
    let surveyReason = ["I travel to decompress. I like to visit popular ande safe places.", "I am adventurous.I love visiting unique destinations", "I pack my trip with activities. I like to visit multiple places at once.", "The word is my playground.Iam always on the road"]
    
    var selectIndex: Int?
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var continueButton: UIButton!

    //TableViewController
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveyImage.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! SurveyTableViewCell
        if indexPath.row == selectIndex{
            cell.ImageView.image = UIImage(named: selectSurveyImage[indexPath.item])
            
        }else{
            cell.ImageView.image = UIImage(named: surveyImage[indexPath.row])
        }
//        continueButton.backgroundColor = UIColorFromRGB(rgbValue: 0x34344F)
//        continueButton.setTitleColor(UIColorFromRGB(rgbValue: 0x747C8D), for: .disabled)
        cell.typeLable.text = surveyType[indexPath.item]
        cell.reasonLabel.text = surveyReason[indexPath.item]

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeTableCellState(index: indexPath)
        continueButton.backgroundColor = UIColorFromRGB(rgbValue: 0x0087E2)
        continueButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFFFFFF), for: .normal)
        continueButton.isEnabled = true
    }

    func changeTableCellState(index: IndexPath) {
        selectIndex = index.row
        tableView.reloadData()
    }
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

