//
//  UIFont+Extensions.swift
//  Figma
//
//  Created by Никита Ляпустин on 04.10.2021.
//

import UIKit

extension UIFont {
    static func habibi(with size: CGFloat = 16) -> UIFont {
        return UIFont(name: "Habibi-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
