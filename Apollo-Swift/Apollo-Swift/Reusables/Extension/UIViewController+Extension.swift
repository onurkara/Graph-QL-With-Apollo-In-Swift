//
//  UIViewController+Extension.swift
//
//  Created by Onur on 15.05.2022.
//

//

import UIKit

extension UIViewController {

    func showDefaultDoneAlert(message: String) {
        let alert = UIAlertController(title: Constants.StringValues.errorOccured,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: Constants.StringValues.ok,
                                     style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}
