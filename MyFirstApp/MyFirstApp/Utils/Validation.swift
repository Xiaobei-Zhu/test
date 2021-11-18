//
//  String.swift
//  Nomad
//
//  Created by Hao Jin on 2020/6/22.
//  Copyright © 2020 LotusFlare. All rights reserved.
//
import UIKit

protocol Validator {
    func validate(input: String) -> ValidationResult
}

enum ValidationConst {
    static let accountLengthMin: UInt = 5
    static let accountLengthMax: UInt = 50
    static let passwordLengthMin: UInt = 8
    static let passwordLengthMax: UInt = 50
    static let nameLengthMin: UInt = 1
    static let nameLengthMax: UInt = 50
}
//
extension String {
    func isValid(by validator: Validator) -> Bool {
        return validateBy(validator) == .success
    }

    func isValid(by validators: [Validator]) -> Bool {
        return validators.map({ validateBy($0) == .success }).reduce(true) {
            $0 && $1
        }
    }

    func validateBy(_ validator: Validator) -> ValidationResult {
        return validator.validate(input: self)
    }
}

// MARK: - Validation Rules
enum ValidationResult: Equatable {
    case lengthTooShort
    case lengthTooLong
    case doesntContainAnyCharacters(of: CharacterSet)
    case doesntContainEnoughCharacters
    case notAllowedCharacter(_ characters: [Character])
    case error(message: String)
    case success
}

// MARK: - Basic Validators
class LengthValidator: Validator {
    let minimumLength: UInt
    let maximumLength: UInt

    init(minimumLength: UInt, maximumLength: UInt) {
        self.minimumLength = minimumLength
        self.maximumLength = maximumLength
    }

    func validate(input: String) -> ValidationResult {
        if input.count < minimumLength {
            return .lengthTooShort
        } else if input.count > maximumLength {
            return .lengthTooLong
        }
        return .success
    }
}

class AllowedCharactersValidator: Validator {
    let characterSet: CharacterSet

    init(characterSet: CharacterSet) {
        self.characterSet = characterSet
    }

    func validate(input: String) -> ValidationResult {
        let characters = input.filter { !characterSet.contains(character: $0) }
        if characters.isEmpty {
            return .success
        } else {
            return .notAllowedCharacter(Array(Set<Character>(characters)))
        }
    }
}

class ContainsCharactersValidator: Validator {
    let characterSet: CharacterSet
    let occurences: UInt

    init(characterSet: CharacterSet, occurences: UInt) {
        self.characterSet = characterSet
        self.occurences = occurences
    }

    func validate(input: String) -> ValidationResult {
        let stringSet = CharacterSet(charactersIn: input)

        if !stringSet.isDisjoint(with: characterSet) {
            let characters = Array(input)
            let count = characters.count        //let count = characters.count(where: characterSet.contains(character:))
            return count >= occurences ? .success : .doesntContainEnoughCharacters

        } else {
            return .doesntContainAnyCharacters(of: characterSet)
        }
    }
}

// MARK: - Custom Character Sets
extension CharacterSet {
    static var passwordSpecialCharacters: CharacterSet {
        return CharacterSet(charactersIn: "~@#$%^&*()/:;?,.<>!")
    }

    static var passwordAlphanumericCharacters: CharacterSet {
        return CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890")
    }

    static var passwordAllowedCharacters: CharacterSet {
        return passwordAlphanumericCharacters.union(.passwordSpecialCharacters)
    }

    static var nameSpecialCharacters: CharacterSet {
        return CharacterSet(charactersIn: ".,'-")
    }

    static var nameAllowedCharacters: CharacterSet {
        return alphanumerics.union(nameSpecialCharacters).union(.whitespaces)
    }
}

extension CharacterSet {
    func contains(character: Character) -> Bool {
        let string = String(character)
        let stringCharacterSet = CharacterSet(charactersIn: string)
        return isSuperset(of: stringCharacterSet)
    }
}

// MARK: - Email Validator
class EmailValidator2: Validator {
    enum Constants {
        static let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        static let errorMessage = "Email is not valid"
        static let matchingFormat = "SELF MATCHES %@"
    }

    func validate(input: String) -> ValidationResult {
        let predicate = NSPredicate(format: Constants.matchingFormat, Constants.emailRegex)
        let result = predicate.evaluate(with: input)
        return result ? .success : .error(message: Constants.errorMessage)
    }
}

