//
//  ViewController.swift
//  AutoLayoutTest
//
//  Created by Xiaobei Zhu on 2020/12/15.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var signUp: UIButton!
    @IBOutlet weak var signIn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        signUp.layer.cornerRadius = 30
        signIn.layer.cornerRadius = 30
        
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    

}

