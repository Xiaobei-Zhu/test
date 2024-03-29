//
//  CountryPresenter.swift
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

protocol CountryPresentationLogic {
    func presentCountryInformation(response: [String:[String: Int]])
}

class CountryPresenter: CountryPresentationLogic {
    
    
    
    weak var viewController: CountryDisplayLogic?
    
    // MARK: Presenter Methods

    func presentCountryInformation(response: [String:[String: Int]]) {
        viewController?.displayCountryInformationDEtail(viewModel: response)
    }

}
