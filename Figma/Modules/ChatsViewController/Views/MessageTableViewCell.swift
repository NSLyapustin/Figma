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
                label.snp.makeConstraints { make in
                    make.center.equalToSuperview()
                }
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
        return imageView
    }()

    private let profileNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
        return label
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = .secondaryLighterGray
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.textColor = .label
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

        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().inset(24)
            make.top.equalToSuperview().offset(26)
            make.bottom.equalToSuperview().inset(26)
            make.width.height.equalTo(40)
        }

        profileNameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImageView.snp.trailing).offset(8)
            make.top.equalToSuperview().inset(24)
            make.trailing.lessThanOrEqualTo(timeLabel.snp.leading).inset(-5)
            make.height.equalTo(20)
        }

        messageLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileNameLabel)
            make.top.equalTo(profileNameLabel.snp.bottom).offset(4)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(20)
        }

        let timeConstraints = [
            NSLayoutConstraint(item: timeLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 24),
            NSLayoutConstraint(item: timeLabel, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -24),
        ]
        NSLayoutConstraint.activate(timeConstraints)
        
        timeLabel.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview().inset(24)
        }
    }
}
