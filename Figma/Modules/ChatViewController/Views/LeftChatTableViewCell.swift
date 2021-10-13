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
        return imageView
    }()

    private let messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .leftMessageBackground
        view.layer.cornerRadius = 12
        return view
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
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

        profileImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(17)
            make.top.equalToSuperview().offset(2)
            make.width.height.equalTo(32)
        }

        messageView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(2)
            make.leading.equalTo(profileImageView.snp.trailing).offset(17)
            make.trailing.lessThanOrEqualToSuperview().inset(60)
        }

        messageLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.trailing.leading.equalToSuperview().inset(8)
        }
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.bottom).offset(4)
            make.leading.equalTo(messageView)
            make.trailing.greaterThanOrEqualToSuperview()
            make.bottom.equalToSuperview().inset(4)
        }
    }
}
