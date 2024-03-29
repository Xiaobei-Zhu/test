//
//  CountryRouter.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2021/1/6.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CountryRoutingNavigation {
    func showOrderViewController(countryName: String)
}

protocol CountryDataPassing {
    var dataStore: CountryDataStore? { get set }
}

typealias CountryRouterInput = CountryRoutingNavigation & CountryDataPassing

private enum Segues {
    static let showOrderViewController = "OrderViewController"
}
class CountryRouter: CountryRouterInput {
    func showOrderViewController(countryName: String) {
        viewController?.performSegue(withIdentifier: Segues.showOrderViewController, sender: countryName)
    }
    
    
    var dataStore: CountryDataStore?
    weak var viewController: CountryViewController?
    
    // MARK: Navigation
    
  

}
