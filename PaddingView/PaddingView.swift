//
//  PaddingView.swift
//  EmailVerificationDemo
//
//  Created by JinCong on 2020/12/25.
//

import UIKit

class PaddingView: UIView {
    @IBInspectable var paddingStyle: String = "p1"

    override func awakeFromNib() {

        var padding: CGFloat = 20

        if let style = PaddingStyle(rawValue: paddingStyle) {
            padding = style.padding
        }

        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: padding)
        ])
    }
}
