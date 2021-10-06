//
//  LogoutButton.swift
//  Figma
//
//  Created by Никита Ляпустин on 06.10.2021.
//

import UIKit

class LogoutButton: UIButton {

    // MARK: - Instance Properties
    
    override var intrinsicContentSize: CGSize {
       return CGSize(width: 143, height: 36)
    }

    // MARK: -

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 10))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Vector")
        imageView.tintColor = .label
        return imageView
    }()

    private let logoutLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
        label.text = "Logout"
        return label
    }()

    // MARK: - Initializators

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Instance Properties

    // MARK: -

    private func setup() {
        layer.borderWidth = 1
        layer.borderColor = UIColor.label.cgColor
        layer.cornerRadius = 18

        addSubview(logoutLabel)
        addSubview(arrowImageView)

        let arrowImageViewConstraints = [
            NSLayoutConstraint(item: arrowImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 34),
            NSLayoutConstraint(item: arrowImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 13.33)
        ]
        NSLayoutConstraint.activate(arrowImageViewConstraints)

        let logoutLabelConstraints = [
            NSLayoutConstraint(item: logoutLabel, attribute: .leading, relatedBy: .equal, toItem: arrowImageView, attribute: .trailing, multiplier: 1, constant: 19),
            NSLayoutConstraint(item: logoutLabel, attribute: .centerY, relatedBy: .equal, toItem: arrowImageView, attribute: .centerY, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(logoutLabelConstraints)
    }
}
