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

        dateLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(6)
            make.centerX.equalToSuperview()
        }
    }
}
