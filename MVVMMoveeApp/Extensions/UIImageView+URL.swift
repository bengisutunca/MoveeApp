//
//  UIImageView+URL.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 21.12.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    public func showImage(with url: String) {
        guard let resource = URL(string: url) else { return }
        kf.setImage(with: resource,
                    options: [
                        .transition(ImageTransition.fade(0.5)),
                        .forceTransition,
                        .keepCurrentImageWhileLoading],
                    progressBlock: nil)
        ImageCache.default.memoryStorage.config.totalCostLimit = 1
    }
}
