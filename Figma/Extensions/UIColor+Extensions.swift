//
//  UIColor+Extensions.swift
//  Figma
//
//  Created by Никита Ляпустин on 06.10.2021.
//

import UIKit

extension UIColor {
    
    // MARK: - Type Properties

    static let primaryBlue = {
        return UIColor(red: 0.181, green: 0.543, blue: 0.967, alpha: 1)
    }()

    static var primaryMessageColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
                .white :
                UIColor(red: 0.445, green: 0.456, blue: 0.467, alpha: 1)
        }
    }

    static var primaryImageViewBackogroundColor: UIColor {
        return UIColor { (traits) -> UIColor in
            return traits.userInterfaceStyle == .dark ?
                UIColor(red: 0.197, green: 0.205, blue: 0.213, alpha: 1) :
                UIColor(red: 0.925, green: 0.921, blue: 0.929, alpha: 1)
        }
    }
}
