//
//  PasswordValidationResult.swift
//  Nomad
//
//  Created by JinCong on 2020/6/30.
//  Copyright © 2020 LotusFlare. All rights reserved.
//

import UIKit

struct PasswordValidationResult: Equatable {
    var atLeastOneLetter = false
    var atLeastOneNumber = false
    var atLeastEightCharactersLong = false
    var unallowedCharacters: [Character]?
    var containsUnallowedCharacters: Bool {
        unallowedCharacters != nil && !unallowedCharacters!.isEmpty
    }

    var isValid: Bool {
        return atLeastOneLetter && atLeastOneNumber && atLeastEightCharactersLong
            && !containsUnallowedCharacters
    }

    func toHintAttributedText() -> NSAttributedString {
        let passwordHintAtLeastEightCharacters = "Password at least 8 characters"
        let passwordHintAtLeastOneNumber = "At least 1 number"
        let passwordHintAtLeastOneLetter = "At least 1 letter"
        let text = """
            \(passwordHintAtLeastEightCharacters)
            \(passwordHintAtLeastOneNumber)
            \(passwordHintAtLeastOneLetter)
            """

        let attributedText = NSMutableAttributedString.init(string: text)
        if self.atLeastEightCharactersLong {
            let range = text.range(of: passwordHintAtLeastEightCharacters)!
            attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(range, in: text))
        }

        if self.atLeastOneNumber {
            let range = text.range(of: passwordHintAtLeastOneNumber)!
            attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(range, in: text))
        }

        if self.atLeastOneLetter {
            let range = text.range(of: passwordHintAtLeastOneLetter)!
            attributedText.addAttribute(.foregroundColor, value: UIColor.gray, range: NSRange(range, in: text))
        }
        return attributedText
    }

    func toErrorMessage() -> String? {
        guard atLeastOneLetter, atLeastOneNumber, atLeastEightCharactersLong else {
            return "Password requirement is not met"
        }

        guard let characters = unallowedCharacters, !characters.isEmpty else {
            return nil
        }

        let passwordCannotContain = "Password cannot contain %@"
        let space = "space"

        if characters.contains(" ") {
            return String.localizedStringWithFormat(passwordCannotContain, space)
        }

        let separatedCharacters = String(characters).map { String($0) }.joined(separator: ", ")

        return String.localizedStringWithFormat(passwordCannotContain, separatedCharacters)
    }
}

extension String {
    func validatePassword() -> PasswordValidationResult {
        var result = PasswordValidationResult()
        let password = self

        let lengthValidator = LengthValidator(minimumLength: ValidationConst.passwordLengthMin, maximumLength: ValidationConst.passwordLengthMax)
        let numberValidator = ContainsCharactersValidator(characterSet: .decimalDigits, occurences: 1)
        let letterValidator = ContainsCharactersValidator(characterSet: .letters, occurences: 1)
        let allowedCharactersValidator = AllowedCharactersValidator(characterSet: .passwordAllowedCharacters)

        result.atLeastEightCharactersLong = password.isValid(by: lengthValidator)
        result.atLeastOneNumber = password.isValid(by: numberValidator)
        result.atLeastOneLetter = password.isValid(by: letterValidator)
        let allowedCharactersValidateResult = password.validateBy(allowedCharactersValidator)
        switch allowedCharactersValidateResult {
        case .notAllowedCharacter(let characters):
            result.unallowedCharacters = characters
        default:
            result.unallowedCharacters = nil
        }

        return result
    }
}

