//
//  OrderRouter.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/8.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol OrderRoutingNavigation {
    func showNewScreen()
}

protocol OrderDataPassing {
    var dataStore: OrderDataStore? { get set }
}

typealias OrderRouterInput = OrderRoutingNavigation & OrderDataPassing

class OrderRouter: OrderRouterInput {
    
    var dataStore: OrderDataStore?
    weak var viewController: OrderViewController?
    
    // MARK: Navigation
    
    func showNewScreen() {
        
    }

}
