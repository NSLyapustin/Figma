//
//  ProfileViewController.swift
//  Figma
//
//  Created by Никита Ляпустин on 06.10.2021.
//

import UIKit

class ProfileViewController: UIViewController {

    // MARK: - Instance Properties

    // MARK: -
    
    private let logoutButton = LogoutButton()

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if previousTraitCollection?.userInterfaceStyle == .dark {
            logoutButton.layer.borderColor = UIColor.black.cgColor
        } else {
            logoutButton.layer.borderColor = UIColor.white.cgColor
        }
    }

    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        view.backgroundColor = .systemBackground
        navigationItem.largeTitleDisplayMode = .always
        title = "Alex Tsimikas"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font : UIFont.habibi(with: 34)]
        let button = UIButton(type: .custom)
        let attributedString = NSMutableAttributedString(string: "Messages", attributes: [NSAttributedString.Key.font : UIFont.habibi(with: 17)])
        button.setAttributedTitle(attributedString, for: .normal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        button.addTarget(self, action: #selector(onMessagesButtonTouchUpInside), for: .touchUpInside)
    
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoutButton)
        
        logoutButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().inset(136)
        }
    }

    @objc private func onMessagesButtonTouchUpInside() {
        navigationController?.pushViewController(ChatsViewController(), animated: true)
    }
}
