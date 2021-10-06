//
//  PinnedCollectionViewCell.swift
//  Figma
//
//  Created by Никита Ляпустин on 03.10.2021.
//

import UIKit

class PinnedCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Type Properties

    static let identifier = "PinnedCollectionViewCell"
    
    // MARK: - Instance Properties

    var profileName: String? {
        didSet {
            guard let profileName = profileName else {
                return
            }
            nameLabel.text = profileName
        }
    }

    var profileImage: UIImage? {
        didSet {
            if let profileImage = profileImage {
                profileImageView.image = profileImage
            } else {
                profileImageView.backgroundColor = UIColor.primaryImageViewBackogroundColor
                let label = UILabel()
                label.font = UIFont.habibi(with: 14)
                guard let firstLetter = profileName?.first else {
                    return
                }
                label.text = String(describing: firstLetter)
                label.textColor = UIColor.primaryBlue
                label.translatesAutoresizingMaskIntoConstraints = false
                profileImageView.addSubview(label)
                label.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 0).isActive = true
                label.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor, constant: 0).isActive = true
            }
        }
    }

    // MARK: -

    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 24
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
        return label
    }()

    // MARK: - UICollectionViewCell Methods

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(profileImageView)
        
        let profileImageConstaints = [
            NSLayoutConstraint(item: profileImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: profileImageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0),
            profileImageView.heightAnchor.constraint(equalToConstant: 48),
            profileImageView.widthAnchor.constraint(equalToConstant: 48)
        ]
        NSLayoutConstraint.activate(profileImageConstaints)

        let nameLabelConstraints = [
            NSLayoutConstraint(item: nameLabel, attribute: .centerX, relatedBy: .equal, toItem: profileImageView, attribute: .centerX, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: nameLabel, attribute: .top, relatedBy: .equal, toItem: profileImageView, attribute: .bottom, multiplier: 1, constant: 8)
        ]
        NSLayoutConstraint.activate(nameLabelConstraints)
    }
}
