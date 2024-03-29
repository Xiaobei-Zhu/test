//
//  EmailConpleteInteractor.swift
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

protocol EmailConpleteBusinessLogic {
    // func doSomething(request: EmailConplete.Something.Request)    
}

protocol EmailConpleteDataStore {
    // var name: String { get set }
}

class EmailConpleteInteractor: EmailConpleteBusinessLogic, EmailConpleteDataStore {
    
    var presenter: EmailConpletePresentationLogic?
    lazy var worker: EmailConpleteWorker? = {
        return EmailConpleteWorker()
    }()
    
    // MARK: Interactor Methods

    // func doSomething(request: EmailConplete.Something.Request) {
    //     worker = EmailConpleteWorker()
    //     worker?.doSomeWork()
        
    //     let response = EmailConplete.Something.Response()
    //     presenter?.presentSomething(response: response)
    // }

}
