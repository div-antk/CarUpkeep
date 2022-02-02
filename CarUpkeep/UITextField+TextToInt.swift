//
//  UITextField+TextToInt.swift
//  CarUpkeep
//
//  Created by Takuya Ando on 2022/02/02.
//

import UIKit

extension UITextField {
    var textToInt: Int {
        let text = self.text
        let int = text
            .flatMap{Int($0)} ?? 0
        return int
    }
}
