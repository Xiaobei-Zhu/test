//
//  RestaurantDetailViewCellViewController.swift
//  FirstProject
//
//  Created by Xiaobei Zhu on 2020/12/19.
//

import UIKit

class RestaurantDetailViewCellViewController: UIViewController {

    @IBOutlet var restaurantImageView: UIImageView!
    
    var restaurantImage = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        restaurantImageView.image = UIImage(named: restaurantImage)
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
