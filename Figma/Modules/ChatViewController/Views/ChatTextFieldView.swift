//
//  ChatTextFieldView.swift
//  Figma
//
//  Created by Никита Ляпустин on 10.10.2021.
//

import UIKit

protocol ChatTextFieldViewDelegate: AnyObject {
    func onSendButtonTouchUpInside()
}

class ChatTextFieldView: UIView {

    // MARK: - Instance Properties

    weak var delegate: ChatTextFieldViewDelegate?

    // MARK: -

    private let messageTextField: UITextField = {
        let textField = TextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .textFieldBackground
        textField.attributedPlaceholder = NSAttributedString(string: "Type your message here...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.habibi(with: 14)])
        return textField
    }()

    private let sendButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16

        button.setImage(UIImage(named: "send"), for: .normal)
        
        return button
    }()

    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        return dateFormatter
    }()

    // MARK: - Initializers

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Instance Methods

    // MARK: -
    
    private func setup() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.heightAnchor.constraint(equalToConstant: 88).isActive = true
    
        addSubview(messageTextField)
        addSubview(sendButton)
    
        let messageTextFieldConstraints = [
            NSLayoutConstraint(item: messageTextField, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 16),
            NSLayoutConstraint(item: messageTextField, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1, constant: -16),
            NSLayoutConstraint(item: messageTextField, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1, constant: -36),
            NSLayoutConstraint(item: messageTextField, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 12)
        ]
        NSLayoutConstraint.activate(messageTextFieldConstraints)
    
        let sendButtonConstraints = [
            NSLayoutConstraint(item: sendButton, attribute: .trailing, relatedBy: .equal, toItem: messageTextField, attribute: .trailing, multiplier: 1, constant: -4),
            NSLayoutConstraint(item: sendButton, attribute: .centerY, relatedBy: .equal, toItem: messageTextField, attribute: .centerY, multiplier: 1, constant: 0)
        ]
        NSLayoutConstraint.activate(sendButtonConstraints)

        sendButton.addTarget(self, action: #selector(onSendButtonTouchUpInside), for: .touchUpInside)
    }

    @objc private func onSendButtonTouchUpInside() {
        guard let text = messageTextField.text,
              !text.isEmpty
        else {
            return
        }
        let time = dateFormatter.string(from: Date())
        Data.messageSections[Data.messageSections.count - 1].messages.append(Message(text: text, time: time, isOutgoing: true))
        delegate?.onSendButtonTouchUpInside()
    }
}
