//
//  UIImage+Darken.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 25.12.2022.
//

import Foundation
import UIKit

extension UIView {
    func addOverlay(color: UIColor = .black, alpha: CGFloat = 0.5) {
        let overlay = UIView()
        overlay.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        overlay.frame = bounds
        overlay.backgroundColor = color
        overlay.alpha = alpha
        overlay.layer.opacity = 0.5
        addSubview(overlay)
    }
}
