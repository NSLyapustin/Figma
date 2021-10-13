//
//  ChatViewController.swift
//  Figma
//
//  Created by Никита Ляпустин on 10.10.2021.
//

import UIKit

class ChatViewController: UIViewController {

    // MARK: - Instance Properties

    // MARK: -

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(LeftChatTableViewCell.self, forCellReuseIdentifier: LeftChatTableViewCell.identifier)
        tableView.register(RightChatTableViewCell.self, forCellReuseIdentifier: RightChatTableViewCell.identifier)
        tableView.register(ChatSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: ChatSectionHeaderView.identifier)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.separatorStyle = .none
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private let chatTextFieldView = ChatTextFieldView()

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        tableView.dataSource = self
        tableView.delegate = self
        navigationItem.largeTitleDisplayMode = .never
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        chatTextFieldView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(chatTextFieldView)
    
        let label = UILabel()
        let mutableString = NSMutableAttributedString(string: "Jessica Thompson", attributes: [NSAttributedString.Key.font : UIFont.habibi(with: 17)])
        label.attributedText = mutableString
        navigationItem.titleView = label

        let chatTextFieldViewConstraints = [
            chatTextFieldView.heightAnchor.constraint(equalToConstant: 88),
            NSLayoutConstraint(item: chatTextFieldView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: chatTextFieldView, attribute: .bottom, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: chatTextFieldView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(chatTextFieldViewConstraints)
        chatTextFieldView.delegate = self
        chatTextFieldView.addBorders(edges: [.top], color: .lightGray, thickness: 0.5)

        let tableViewConstraints = [
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: chatTextFieldView, attribute: .top, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)

        navigationItem.hidesBackButton = true

        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.setImage(UIImage(named: "BackIcon"), for: .normal)
        button.contentVerticalAlignment = .fill
        button.contentHorizontalAlignment = .fill
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem?.tintColor = .label

        button.addTarget(self, action: #selector(onBackButtonTouchUpInside), for: .touchUpInside)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)

        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc private func onBackButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }

    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue, view.frame.origin.y == 0 {
            view.frame.origin.y -= keyboardSize.height - view.safeAreaInsets.bottom
        }
    }

    @objc private func keyboardWillHide(notification: NSNotification) {
        view.frame.origin.y = 0
    }
}

    // MARK: - UITableViewDataSource Methods

extension ChatViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = Data.messageSections[indexPath.section].messages[indexPath.row]
        if message.isOutgoing {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: RightChatTableViewCell.identifier, for: indexPath) as? RightChatTableViewCell else {
                return UITableViewCell()
            }
            cell.time = message.time
            cell.messageText = message.text
            return cell
        } else {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: LeftChatTableViewCell.identifier, for: indexPath) as? LeftChatTableViewCell else {
                return UITableViewCell()
            }
            cell.profileImage = UIImage(named: "Profile1")
            cell.time = message.time
            cell.messageText = message.text
            return cell
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Data.messageSections[section].messages.count
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        Data.messageSections.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: ChatSectionHeaderView.identifier) as? ChatSectionHeaderView else {
            return UIView()
        }
        header.date = Data.messageSections[section].date
        return header
    }
}

    // MARK: - ChatTextFieldViewDelegate Methods

extension ChatViewController: ChatTextFieldViewDelegate {
    func onSendButtonTouchUpInside() {
        tableView.reloadData()
    }
}
