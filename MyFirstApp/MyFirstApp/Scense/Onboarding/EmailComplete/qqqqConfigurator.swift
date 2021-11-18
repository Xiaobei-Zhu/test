//
//  qqqqConfigurator.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/25.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// MARK: - Connects View, Interactor, and Presenter
class qqqqConfigurator {
    
    static let sharedInstance = qqqqConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(_ viewController: qqqqViewController) {
        let presenter = qqqqPresenter()
        presenter.viewController = viewController
        
        let interactor = qqqqInteractor()
        interactor.presenter = presenter
        
        let router = qqqqRouter()
        router.viewController = viewController
        router.dataStore = interactor
        
        viewController.interactor = interactor
        viewController.router = router
    }
}