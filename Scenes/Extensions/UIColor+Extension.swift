//
//  UIColor+Extension.swift
//  QuizApp
//
//  Created by Ana Dzebniauri on 13.06.23.
//

import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int, alpha: CGFloat) {
        self.init(
            red: CGFloat(red)/255,
            green: CGFloat(green)/255,
            blue: CGFloat(blue)/255,
            alpha: alpha
        )
    }
}
