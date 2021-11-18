//
//  PaddingStyle.swift
//  EmailVerificationDemo
//
//  Created by JinCong on 2020/12/25.
//

import UIKit

enum PaddingStyle: String {
    case p0
    case p1
    case p2
    case p4
    case p5
    case p6
    case p10
    case p20
    case p25
    case header

    var padding: CGFloat {
        return verticalPadding
    }

    var verticalPadding: CGFloat {
        var padding: CGFloat = 20
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        let paddingMapping =
            screenHeight <= 667 ? PaddingStyle.smallPadding : (screenWidth > 375 ? PaddingStyle.normalPadding : PaddingStyle.compactPadding)

        padding = paddingMapping[self] ?? padding

        return padding
    }

    var horizontalPadding: CGFloat {
        let screenWith = UIScreen.main.bounds.width
        return (screenWith * 0.08).rounded()
    }

    private static let smallPadding: [PaddingStyle: CGFloat] = [
        .p0: 4,
        .p1: 8,
        .p2: 16,
        .p4: 24,
        .p5: 32,
        .p6: 40,
        .p10: 66,
        .p20: 132,
        .p25: 164,
        .header: 190,
    ]

    private static let compactPadding: [PaddingStyle: CGFloat] = [
        .p0: 5,
        .p1: 10,
        .p2: 20,
        .p4: 30,
        .p5: 40,
        .p6: 50,
        .p10: 80,
        .p20: 160,
        .p25: 200,
        .header: 210,
    ]

    private static let normalPadding: [PaddingStyle: CGFloat] = [
        .p0: 6,
        .p1: 11,
        .p2: 22,
        .p4: 33,
        .p5: 44,
        .p6: 55,
        .p10: 88,
        .p20: 177,
        .p25: 220,
        .header: 230,
    ]

}

