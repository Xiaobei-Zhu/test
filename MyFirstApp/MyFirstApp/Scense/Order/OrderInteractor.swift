//
//  OrderInteractor.swift
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

protocol OrderBusinessLogic {
    // func doSomething(request: Order.Something.Request)    
}

protocol OrderDataStore {
    // var name: String { get set }
}

class OrderInteractor: OrderBusinessLogic, OrderDataStore {
    
    var presenter: OrderPresentationLogic?
    lazy var worker: OrderWorker? = {
        return OrderWorker()
    }()
    
    // MARK: Interactor Methods

    // func doSomething(request: Order.Something.Request) {
    //     worker = OrderWorker()
    //     worker?.doSomeWork()
        
    //     let response = Order.Something.Response()
    //     presenter?.presentSomething(response: response)
    // }

}
