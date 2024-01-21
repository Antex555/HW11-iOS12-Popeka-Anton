//
//  UIView+Extensions.swift
//  HW11-iOS12
//
//  Created by Anton Popeka on 18/01/24.
//

import UIKit

extension UIView {
    func addSubViews (_ views: [UIView]) {
        views.forEach { self.addSubview($0) }
    }
}

extension UITextField {
    func setLeftIcon (_ image: UIImage) {
        let iconView = UIImageView(frame: CGRect(x: 0, y: 5, width: 20, height: 20))
        iconView.image = image
        let iconContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        iconContainerView.addSubview(iconView)
        leftView = iconContainerView
        leftViewMode = .always
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        switch reason {
        case .committed:
            print(textField.text ?? " ")
         
        @unknown default:
            fatalError()
        }
    }
}


