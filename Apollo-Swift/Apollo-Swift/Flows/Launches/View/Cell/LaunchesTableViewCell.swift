//
//  LaunchesTableViewCell.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

import UIKit

final class LaunchesTableViewCell: BaseTableViewCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var launchYearLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupUI()
    }

    private func setupUI() {
        nameLabel.applyPrimaryStyle()
        launchYearLabel.applySecondaryStyle()
    }

    func configure(name: String?, launchYear: String?) {
        nameLabel.text = name
        launchYearLabel.text = launchYear
    }
}
