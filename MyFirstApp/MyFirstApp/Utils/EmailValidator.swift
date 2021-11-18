//
//  EmailValidator.swift
//  MyFirstApp
//
//  Created by Xiaobei Zhu on 2020/12/28.
//

import UIKit

class EmailValidator {
    enum Constants {
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let matchingFormat = "SELF MATCHES %@"
    }

    static func validate(input: String) -> Bool {
        let predicate = NSPredicate(format: Constants.matchingFormat, Constants.emailRegex)
        return predicate.evaluate(with: input)
    }
}
