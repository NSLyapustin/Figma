//
//  MessageTableViewCell.swift
//  Figma
//
//  Created by Никита Ляпустин on 03.10.2021.
//

import UIKit

class MessageTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let identifier = "MessageTableViewCell"

    // MARK: - Instance Properties

    var profileName: String? {
        didSet {
            guard let profileName = profileName else {
                return
            }
            profileNameLabel.text = profileName
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

    var message: String? {
        didSet {
            guard let message = message else {
                return
            }
            messageLabel.text = message
        }
    }

    var time: String? {
        didSet {
            guard let time = time else {
                return
            }
            timeLabel.text = time
        }
    }

    // MARK: -

    private let profileImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        imageView.layer.cornerRadius = 20
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = UIColor.primaryMessageColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - UITableViewCell Methods

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods
    
    // MARK: -

    private func setup() {
        addSubview(profileImageView)
        addSubview(profileNameLabel)
        addSubview(messageLabel)
        addSubview(timeLabel)

        let profileImageConstraints = [
            NSLayoutConstraint(item: profileImageView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 24),
            NSLayoutConstraint(item: profileImageView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 26),
            NSLayoutConstraint(item: profileImageView, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -26),
            profileImageView.widthAnchor.constraint(equalToConstant: 40),
            profileImageView.heightAnchor.constraint(equalToConstant: 40)
        ]
        NSLayoutConstraint.activate(profileImageConstraints)

        let profileNameConstraints = [
            NSLayoutConstraint(item: profileNameLabel, attribute: .leading, relatedBy: .equal, toItem: profileImageView, attribute: .trailing, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: profileNameLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24),
            NSLayoutConstraint(item: profileNameLabel, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: timeLabel, attribute: .leading, multiplier: 1, constant: 20),
            profileNameLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(profileNameConstraints)

        let messageConstraints = [
            NSLayoutConstraint(item: messageLabel, attribute: .leading, relatedBy: .equal, toItem: profileNameLabel, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: profileNameLabel, attribute: .bottom, multiplier: 1, constant: 4),
            NSLayoutConstraint(item: messageLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -43),
            messageLabel.heightAnchor.constraint(equalToConstant: 20)
        ]
        NSLayoutConstraint.activate(messageConstraints)

        let timeConstraints = [
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24),
            NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -24),
        ]
        NSLayoutConstraint.activate(timeConstraints)
    }
}
