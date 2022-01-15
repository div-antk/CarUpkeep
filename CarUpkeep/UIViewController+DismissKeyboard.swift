//
//  UIViewController+DismissKeyboard.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/01/15.
//

import UIKit

extension UIViewController {

    // 領域外タップでキーボードを閉じる
    func setDismissKeyboard() {
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGR.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGR)
    }

    @objc
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
