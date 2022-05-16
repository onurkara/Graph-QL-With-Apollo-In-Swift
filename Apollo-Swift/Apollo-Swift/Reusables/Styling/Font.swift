//
//  Font.swift
//
//  Created by Onur on 15.05.2022.
//

import UIKit

enum Font {

    private enum Constant {

        static let smallSize: CGFloat = 12.0
        static let normalSize: CGFloat = 14.0
    }

    case boldSmall
    case boldNormal
    case regularSmall
    case regularNormal

    var value: UIFont {
        switch self {
        case .boldSmall:
            return UIFont.systemFont(ofSize: Constant.smallSize)
        case .boldNormal:
            return UIFont.boldSystemFont(ofSize: Constant.normalSize)
        case .regularSmall:
            return UIFont.systemFont(ofSize: Constant.smallSize)
        case .regularNormal:
            return UIFont.systemFont(ofSize: Constant.normalSize)
        }
    }
}
