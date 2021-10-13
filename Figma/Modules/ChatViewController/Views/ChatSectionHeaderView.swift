//
//  ChatSectionHeaderView.swift
//  Figma
//
//  Created by Никита Ляпустин on 13.10.2021.
//

import UIKit

class ChatSectionHeaderView: UITableViewHeaderFooterView {

    // MARK: - Type Properties

    static let identifier = "ChatSectionHeaderView"
    
    // MARK: - Instance Properties

    var date: String? {
        didSet{
            guard let date = date else {
                return
            }
            dateLabel.text = date
        }
    }

    // MARK: -

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.habibi(with: 12)
        label.textColor = .secondaryLighterGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Initializators

    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        addSubview(dateLabel)
        contentView.backgroundColor = .systemBackground
    
        let dateLabelConstraints = [
            NSLayoutConstraint(item: dateLabel, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 6),
            NSLayoutConstraint(item: dateLabel, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -6),
            dateLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ]
        NSLayoutConstraint.activate(dateLabelConstraints)
    }
}
