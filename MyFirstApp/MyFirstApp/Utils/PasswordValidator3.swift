//
//  PassWordValidator.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/29.
//

import UIKit
class PasswordValidator2: Validator {
    enum Constants {
       static let passwordRegex = "^(?=.*[a-z])(?=.*[$@$#!%*?&]).{8,}$"
       static let matchingFormat = "SELF MATCHES %@"
           }
    func validate(input: String) -> ValidationResult {
//        let predicate = NSPredicate(format: Constants.matchingFormat, Constants.passwordRegex)
//        let result = predicate.predicateFormat
//        return result
        let lengValidator = LengthValidator(minimumLength: 8, maximumLength: 256)
        let lengthResult = input.validateBy(lengValidator)
        
        return lengthResult
    }
}
