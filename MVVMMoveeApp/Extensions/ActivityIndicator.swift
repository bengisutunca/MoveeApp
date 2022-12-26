//
//  ActivityIndicator.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 25.12.2022.
//

import UIKit

extension UIView {
    func activityStartAnimating(activityColor: UIColor, backgroundColor: UIColor) {
        
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
}
