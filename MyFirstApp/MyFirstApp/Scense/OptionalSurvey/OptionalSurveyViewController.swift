//
//  OptionalSurveyViewController.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/31.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol OptionalSurveyDisplayLogic: class {
    func displaySomething(viewModel: OptionalSurvey.Something.ViewModel)
}

class OptionalSurveyViewController: UIViewController, OptionalSurveyDisplayLogic {
    
    // MARK: - Properties
    var interactor: OptionalSurveyBusinessLogic?
    var router: OptionalSurveyRouterInput?
    let surveyImage = ["Vacationer1.png", "Explorer1.png", "Jetsetter1.png", "Nomad1.png"]
    let selectSurveyImage = ["Vacationer2.png", "Explorer2.png", "Jetsetter2.png", "Nomad2.png"]
    let surveyType = ["Vacation", "Explorer", "Jetsetter", "Nomad"]
    let surveyReason = ["I travel to decompress. I like to visit popular ande safe places.", "I am adventurous.I love visiting unique destinations", "I pack my trip with activities. I like to visit multiple places at once.", "The word is my playground.Iam always on the road"]
    var selectIndex:Int?
    // Mark: - Outlets
    @IBOutlet var tableView: UITableView!
    @IBOutlet var continueButton: UIButton!
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Object Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        OptionalSurveyConfigurator.sharedInstance.configure(self)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: - Do something
    
    func doSomething() {
        
    }
    
    func displaySomething(viewModel: OptionalSurvey.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}


extension OptionalSurveyViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surveyImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! OptionalSurveyTableViewCell
        if indexPath.row == selectIndex{
            cell.ImageView.image = UIImage(named: selectSurveyImage[indexPath.row])
            
        }else{
            cell.ImageView.image = UIImage(named: surveyImage[indexPath.row])
        }
        cell.TypeLabel.text = surveyType[indexPath.row]
        cell.ReasonLabel.text = surveyReason[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        changeTableCellState(index: indexPath)
        continueButton.backgroundColor = UIColor.init(named: "Enable ButtonColor")
        continueButton.setTitleColor(UIColor.init(named: "White Color"), for: .normal)
        continueButton.isEnabled = true
    }
    
    func changeTableCellState(index: IndexPath) {
        selectIndex = index.row
        tableView.reloadData()
    }
}