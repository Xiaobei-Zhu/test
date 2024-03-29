//
//  SurveyPurposeInteractor.swift
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

protocol SurveyPurposeBusinessLogic {
    // func doSomething(request: SurveyPurpose.Something.Request)    
}

protocol SurveyPurposeDataStore {
    // var name: String { get set }
}

class SurveyPurposeInteractor: SurveyPurposeBusinessLogic, SurveyPurposeDataStore {
    
    var presenter: SurveyPurposePresentationLogic?
    lazy var worker: SurveyPurposeWorker? = {
        return SurveyPurposeWorker()
    }()
    
    // MARK: Interactor Methods

    // func doSomething(request: SurveyPurpose.Something.Request) {
    //     worker = SurveyPurposeWorker()
    //     worker?.doSomeWork()
        
    //     let response = SurveyPurpose.Something.Response()
    //     presenter?.presentSomething(response: response)
    // }

}
