//
//  LeftChatTableViewCell.swift
//  Figma
//
//  Created by Никита Ляпустин on 12.10.2021.
//

import UIKit

class LeftChatTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let identifier = "LeftChatTableViewCell"

    // MARK: - Instance Properties
    
    var profileImage: UIImage? {
        didSet {
            if let profileImage = profileImage {
                profileImageView.image = profileImage
            } else {
                profileImageView.backgroundColor = UIColor.primaryImageViewBackogroundColor
                let label = UILabel()
                label.font = UIFont.habibi(with: 14)
                label.text = "J"
                label.textColor = UIColor.primaryBlue
                label.translatesAutoresizingMaskIntoConstraints = false
                profileImageView.addSubview(label)
                label.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor, constant: 0).isActive = true
                label.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor, constant: 0).isActive = true
            }
        }
    }

    var messageText: String? {
        didSet {
            messageLabel.text = messageText
        }
    }

    var time: String? {
        didSet {
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

    private let messageView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .leftMessageBackground
        view.layer.cornerRadius = 12
        return view
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .label
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .timeTextColor
        return label
    }()

    // MARK: - Initializators

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
        contentView.addSubview(messageView)
        contentView.addSubview(timeLabel)
        messageView.addSubview(messageLabel)
        contentView.addSubview(profileImageView)
        
        let profileImageViewConstraints = [
            NSLayoutConstraint(item: profileImageView, attribute: .leading, relatedBy: .equal, toItem: contentView, attribute: .leading, multiplier: 1, constant: 17),
            NSLayoutConstraint(item: profileImageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 2),
            profileImageView.widthAnchor.constraint(equalToConstant: 32),
            profileImageView.widthAnchor.constraint(equalToConstant: 32)
        ]
        NSLayoutConstraint.activate(profileImageViewConstraints)

        let messageViewConstraints = [
            NSLayoutConstraint(item: messageView, attribute: .top, relatedBy: .equal, toItem: contentView, attribute: .top, multiplier: 1, constant: 2),
            NSLayoutConstraint(item: messageView, attribute: .leading, relatedBy: .equal, toItem: profileImageView, attribute: .trailing, multiplier: 1, constant: 17),
            NSLayoutConstraint(item: messageView, attribute: .trailing, relatedBy: .lessThanOrEqual, toItem: contentView, attribute: .trailing, multiplier: 1, constant: -60)
        ]
        NSLayoutConstraint.activate(messageViewConstraints)

        let messageLabelConstraints = [
            NSLayoutConstraint(item: messageLabel, attribute: .top, relatedBy: .equal, toItem: messageView, attribute: .top, multiplier: 1, constant: 4),
            NSLayoutConstraint(item: messageLabel, attribute: .trailing, relatedBy: .equal, toItem: messageView, attribute: .trailing, multiplier: 1, constant: -8),
            NSLayoutConstraint(item: messageLabel, attribute: .leading, relatedBy: .equal, toItem: messageView, attribute: .leading, multiplier: 1, constant: 8),
            NSLayoutConstraint(item: messageLabel, attribute: .bottom, relatedBy: .equal, toItem: messageView, attribute: .bottom, multiplier: 1, constant: -4)
        ]
        NSLayoutConstraint.activate(messageLabelConstraints)
        
        let timeLabelConstraints = [
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: messageView, attribute: .bottom, multiplier: 1, constant: 4),
            NSLayoutConstraint(item: timeLabel, attribute: .leading, relatedBy: .equal, toItem: messageView, attribute: .leading, multiplier: 1, constant: -4),
            NSLayoutConstraint(item: timeLabel, attribute: .bottom, relatedBy: .equal, toItem: contentView, attribute: .bottom, multiplier: 1, constant: -4),
            NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .greaterThanOrEqual, toItem: contentView, attribute: .trailing, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(timeLabelConstraints)
    }
}
