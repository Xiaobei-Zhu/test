//
//  SearchConfigurator.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/3.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

// MARK: - Connects View, Interactor, and Presenter
class SearchConfigurator {
    
    static let sharedInstance = SearchConfigurator()
    
    private init() {}
    
    // MARK: - Configuration
    
    func configure(_ viewController: SearchViewController) {
        let presenter = SearchPresenter()
        presenter.viewController = viewController
        
        let interactor = SearchInteractor()
        interactor.presenter = presenter
        
        let router = SearchRouter()
        router.viewController = viewController
        router.dataStore = interactor
        
        viewController.interactor = interactor
        viewController.router = router
    }
}
