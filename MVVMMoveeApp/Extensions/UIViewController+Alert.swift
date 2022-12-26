//
//  UIViewController+Alert.swift
//  MVVMMoveeApp
//
//  Created by Tunca, Bengisu on 26.12.2022.
//

import UIKit

extension UIViewController {
    func showAlert(alertMessage: String) {
        let alert = UIAlertController(title: alertMessage, message: "", preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: Localization.okButton, style: UIAlertAction.Style.cancel)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}
