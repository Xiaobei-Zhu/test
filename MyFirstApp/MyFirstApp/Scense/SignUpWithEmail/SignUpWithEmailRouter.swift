//
//  SignUpWithEmailRouter.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/28.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol SignUpWithEmailRoutingNavigation {
    func showNewScreen()
//    func showOptionalSurveyViewController()
}

protocol SignUpWithEmailDataPassing {
    var dataStore: SignUpWithEmailDataStore? { get set }
}

typealias SignUpWithEmailRouterInput = SignUpWithEmailRoutingNavigation & SignUpWithEmailDataPassing

class SignUpWithEmailRouter: SignUpWithEmailRouterInput {

    
    var dataStore: SignUpWithEmailDataStore?
    weak var viewController: SignUpWithEmailViewController?
    
    // MARK: Navigation
    
    func showNewScreen() {
//        viewController?.performSegue(withIdentifier: "Viewcontroller", sender: nil)
    }

//    func showOptionalSurveyViewController() {
//
//    }
}