//
//  OrderPresenter.swift
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

protocol OrderPresentationLogic {
    // func presentSomething(response: Order.Something.Response)
}

class OrderPresenter: OrderPresentationLogic {
    
    weak var viewController: OrderDisplayLogic?
    
    // MARK: Presenter Methods

    // func presentSomething(response: Order.Something.Response) {
    //     let viewModel = Order.Something.ViewModel()
    //     viewController?.displaySomething(viewModel: viewModel)
    // }

}
