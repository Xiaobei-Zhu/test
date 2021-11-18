//
//  CollectionViewController.swift
//  ThirdWeekTest
//
//  Created by Xiaobei Zhu on 2020/12/22.
//

import UIKit

class CollectionViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var saveButton: UIButton!

    let travelImage = ["leisure3 1.png", "home 1.png", "Page 4.png", "Page 1.png"]
    let travelLabel = ["Leisure", "Family","Work", "School"]
    let selectTravelImage = ["leisure3 2.png", "Page 8.png", "Page 6.png", "Page 5.png"]
    
    var selectedIndex = [IndexPath]()
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return travelImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = "Cell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! SurveyCollectionViewCell
        if selectedIndex.contains(indexPath){
            cell.checkImage.image = UIImage(named: "Selected.png")
            cell.travelImageView.image = UIImage(named:selectTravelImage[indexPath.row])
            cell.backgroundColor = UIColorFromRGB(rgbValue: 0x0087E2)
            cell.pool.isHidden = true
        }else{
            cell.checkImage.image = UIImage(named: "Checkbox Style Copy.png")
            cell.travelImageView.image = UIImage(named: travelImage[indexPath.row])
            cell.backgroundColor = UIColorFromRGB(rgbValue: 0x1A1B34)
            cell.pool.isHidden = false
        }
        cell.reasonLabel.text = travelLabel[indexPath.row]
            
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        changeCollectionState(index: indexPath)
        collectionView.reloadData()
        if selectedIndex.isEmpty{
            saveButton.backgroundColor = UIColorFromRGB(rgbValue: 0x34344F)
            saveButton.setTitleColor(UIColorFromRGB(rgbValue: 0x747C8D), for: .normal)
            saveButton.isEnabled = false
        }else{
            saveButton.backgroundColor = UIColorFromRGB(rgbValue: 0x0087E2)
            saveButton.setTitleColor(UIColorFromRGB(rgbValue: 0xFFFFFF), for: .normal)
            saveButton.isEnabled = true
        }
        
    }
    func changeCollectionState(index: IndexPath){
        
        if selectedIndex.contains(index){
            selectedIndex.remove(at: selectedIndex.firstIndex(of: index)!)
        }else{
            selectedIndex.append(index)
        }
        
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
