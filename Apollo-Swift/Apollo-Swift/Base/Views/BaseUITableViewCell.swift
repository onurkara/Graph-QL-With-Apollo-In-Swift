//
//  BaseUITableViewCell.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()

        selectionStyle = .none
    }
}

// MARK: - ReusableViewIdentifier
extension BaseTableViewCell: ReusableViewIdentifier { }
