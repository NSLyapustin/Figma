//
//  LogoutButton.swift
//  Figma
//
//  Created by Никита Ляпустин on 06.10.2021.
//

import UIKit
import SnapKit

class LogoutButton: UIButton {

    // MARK: - Instance Properties
    
    override var intrinsicContentSize: CGSize {
       return CGSize(width: 143, height: 36)
    }

    // MARK: -

    private let arrowImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 10))
        imageView.image = UIImage(named: "Vector")
        imageView.tintColor = .label
        return imageView
    }()

    private let logoutLabel: UILabel = {
        let label = UILabel()
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
        
        arrowImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(34)
            make.top.equalToSuperview().inset(13.33)
        }
        
        logoutLabel.snp.makeConstraints { make in
            make.leading.equalTo(arrowImageView.snp.leading).inset(19)
            make.centerY.equalTo(arrowImageView.snp.centerY)
        }
    }
}
