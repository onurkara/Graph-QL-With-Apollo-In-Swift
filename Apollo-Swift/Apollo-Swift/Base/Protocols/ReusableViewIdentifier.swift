//
//  ReusableViewIdentifier.swift
//  MidasAssignment
//
//  Created by Onur on 15.05.2022.
//

protocol ReusableViewIdentifier {

    static var reuseIdentifier: String { get }
}

extension ReusableViewIdentifier {

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
