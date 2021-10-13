//
//  UIView+Extensions.swift
//  Figma
//
//  Created by Никита Ляпустин on 06.10.2021.
//

import UIKit

extension UIView {
    
    // MARK: - Instance Methods

    func addBorders(edges: UIRectEdge,
                        color: UIColor,
                        inset: CGFloat = 0.0,
                        thickness: CGFloat = 1.0) {
            if edges.contains(.top) || edges.contains(.all) {
                addBorder(formats: "V:|-0-[border(==thickness)]", "H:|-inset-[border]-inset-|",
                          color: color,
                          inset: inset,
                          thickness: thickness)
            }

            if edges.contains(.bottom) || edges.contains(.all) {
                addBorder(formats: "V:[border(==thickness)]-0-|", "H:|-inset-[border]-inset-|",
                          color: color,
                          inset: inset,
                          thickness: thickness)
            }

            if edges.contains(.left) || edges.contains(.all) {
                addBorder(formats: "V:|-inset-[border]-inset-|", "H:|-0-[border(==thickness)]",
                          color: color,
                          inset: inset,
                          thickness: thickness)
            }

            if edges.contains(.right) || edges.contains(.all) {
                addBorder(formats: "V:|-inset-[border]-inset-|", "H:[border(==thickness)]-0-|",
                          color: color,
                          inset: inset,
                          thickness: thickness)
            }
        }

    // MARK: -

    private func addBorder(formats: String...,
                           color: UIColor,
                           inset: CGFloat,
                           thickness: CGFloat) {
        let border = UIView(frame: .zero)
        border.backgroundColor = color
        border.translatesAutoresizingMaskIntoConstraints = false
        addSubview(border)
        addConstraints(formats.flatMap {
                NSLayoutConstraint.constraints(withVisualFormat: $0,
                                               options: [],
                                               metrics: ["inset": inset, "thickness": thickness],
                                               views: ["border": border]) })
    }
}
