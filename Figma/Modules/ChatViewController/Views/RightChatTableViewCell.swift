//
//  RightChatTableViewCell.swift
//  Figma
//
//  Created by Никита Ляпустин on 12.10.2021.
//

import UIKit
import SnapKit

class RightChatTableViewCell: UITableViewCell {

    // MARK: - Type Properties

    static let identifier = "RightChatTableViewCell"

    // MARK: - Instance Properties

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

    private let messageView: UIView = {
        let view = UIView()
        view.backgroundColor = .rightMessageBackground
        view.layer.cornerRadius = 12
        return view
    }()

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 14)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()

    private let timeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 12)
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

        messageView.snp.makeConstraints { make in
            make.top.equalTo(contentView.snp.top).offset(2)
            make.trailing.equalTo(contentView.snp.trailing).inset(17)
            make.leading.greaterThanOrEqualTo(contentView.snp.leading).offset(60)
        }
        
        messageLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(4)
            make.trailing.leading.equalToSuperview().inset(8)
        }

        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(messageView.snp.bottom).offset(4)
            make.trailing.equalTo(messageView)
            make.leading.greaterThanOrEqualToSuperview()
            make.bottom.equalToSuperview().inset(4)
        }
    }
}
