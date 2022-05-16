//
//  UILabel+Extension.swift
//
//  Created by Onur on 15.05.2022.
//

import UIKit

extension UILabel {

    func applyPrimaryStyle() {
        textColor = .black
        font = Font.boldNormal.value
        numberOfLines = 0
    }

    func applySecondaryStyle() {
        textColor = .gray
        font = Font.regularNormal.value
        numberOfLines = 0
    }
}
