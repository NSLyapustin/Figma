//
//  ViewController.swift
//  Figma
//
//  Created by Никита Ляпустин on 03.10.2021.
//

import UIKit

class ChatsViewController: UIViewController {

    // MARK: - Instance Properties

    // MARK: -

    private let tableView: UITableView = UITableView()
    private let searchController = UISearchController(searchResultsController: nil)

    // MARK: - UIViewController Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    // MARK: - Instance Methods

    // MARK: -

    private func setup() {
        navigationItem.largeTitleDisplayMode = .never
        tableView.tableHeaderView = MessagesTableViewHeader(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: 135))
        tableView.dataSource = self
        tableView.delegate = self
        let label = UILabel()
        let mutableString = NSMutableAttributedString(string: "MESSAGES", attributes: [NSAttributedString.Key.font : UIFont.habibi(with: 17)])
        label.attributedText = mutableString
        navigationItem.titleView = label
        navigationItem.largeTitleDisplayMode = .never
        tableView.tableFooterView = UIView()
        
        view.backgroundColor = .systemBackground
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tableViewConstraints = [
            NSLayoutConstraint(item: tableView, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leading, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: tableView, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailing, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(tableViewConstraints)
        tableView.backgroundColor = .systemBackground

        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 32, height: 32)
        button.setImage(UIImage(named: "BackIcon"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        navigationItem.leftBarButtonItem?.tintColor = .label

        button.addTarget(self, action: #selector(onBackButtonTouchUpInside), for: .touchUpInside)

        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        
        searchController.obscuresBackgroundDuringPresentation = false
        let searchPlaceholderMutableString = NSMutableAttributedString(string: "Who do you want to chat with?", attributes: [NSAttributedString.Key.font : UIFont(name: "Habibi-Regular", size: 17)!])
        searchController.searchBar.searchTextField.attributedPlaceholder = searchPlaceholderMutableString
        searchController.hidesNavigationBarDuringPresentation = false
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
    
        tableView.register(MessageTableViewCell.self, forCellReuseIdentifier: MessageTableViewCell.identifier)
        tableView.rowHeight = UITableView.automaticDimension
    }

    @objc private func onBackButtonTouchUpInside() {
        navigationController?.popViewController(animated: true)
    }
}

    // MARK: - UITableViewDataSource Methods

extension ChatsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageTableViewCell.identifier, for: indexPath) as? MessageTableViewCell else {
            return UITableViewCell()
        }
        cell.separatorInset = UIEdgeInsets.zero
        cell.profileName = Data.names[indexPath.row]
        cell.profileImage = Data.profileImages[indexPath.row]
        cell.message = Data.messages[indexPath.row]
        cell.time = Data.times[indexPath.row]
        return cell
    }
}

    // MARK: - UITableViewDelegate Methods

extension ChatsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)

        let chatViewController = ChatViewController()
        navigationController?.pushViewController(chatViewController, animated: true)
    }
}
