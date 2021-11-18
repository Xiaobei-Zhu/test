//
//  testTemletViewController.swift
//  ThirdWeekTest
//
//  Created by Xiaobei Zhu on 2020/12/28.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol testTemletDisplayLogic: class {
    func displaySomething(viewModel: testTemlet.Something.ViewModel)
}

class testTemletViewController: UIViewController, testTemletDisplayLogic {
    
    // MARK: - Properties
    var interactor: testTemletBusinessLogic?
    var router: testTemletRouterInput?
    
    // Mark: - Outlets
    
    //@IBOutlet weak var nameTextField: UITextField!
    
    // MARK: - Object Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        testTemletConfigurator.sharedInstance.configure(self)
    }
    
    // MARK: - View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSomething()
    }
    
    // MARK: - Do something
    
    func doSomething() {
        
    }
    
    func displaySomething(viewModel: testTemlet.Something.ViewModel) {
        //nameTextField.text = viewModel.name
    }
}
