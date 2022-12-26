//
//  UICollectionViewCell+Rounded.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 24.12.2022.
//

import UIKit

extension UICollectionViewCell {
    func makeRoundedCell() {
        contentView.layer.cornerRadius = 20.0
        contentView.layer.masksToBounds = true
        layer.cornerRadius = 20
        layer.masksToBounds = false
    }
}
