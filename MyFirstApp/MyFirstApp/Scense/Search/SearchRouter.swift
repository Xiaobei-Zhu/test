//
//  SearchRouter.swift
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

protocol SearchRoutingNavigation {
//    func showNewScreen()
    func showCountryScreen(countryName:[String:String])
    func passDataToNextScene(segue: UIStoryboardSegue, sender: Any?)
}

protocol SearchDataPassing {
    var dataStore: SearchDataStore? { get set }
}

typealias SearchRouterInput = SearchRoutingNavigation & SearchDataPassing

class SearchRouter: SearchRouterInput {
    
    
    
    var dataStore: SearchDataStore?
    weak var viewController: SearchViewController?
    private enum Segues {
        static let showCountryViewController = "CountryViewController"
    }
    
    // MARK: Navigation
    func showCountryScreen(countryName: [String: String]) {
        viewController?.performSegue(withIdentifier: Segues.showCountryViewController, sender: countryName)
    }
    
    func showNewScreen() {
        
    }
    
    func passDataToNextScene(segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Segues.showCountryViewController, let destination = segue.destination as? CountryViewController {
            destination.router?.dataStore?.countryInformationDetail = sender as! [String: String]
        }
      }
}

extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        router?.passDataToNextScene(segue: segue, sender: sender)
    }
}