//
//  UITableView+Extension.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

import UIKit

extension UITableView {

    func registerCell(type: BaseTableViewCell.Type, identifier: String? = nil) {
            let cellId = String(describing: type)
            register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: identifier ?? cellId)
        }

    func dequeueReusableCell<T: BaseTableViewCell>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError()
        }

        return cell
    }
}
