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
        textField.layer.cornerRadius = 20
        textField.backgroundColor = .textFieldBackground
        textField.attributedPlaceholder = NSAttributedString(string: "Type your message here...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.label,
            NSAttributedString.Key.font: UIFont.habibi(with: 14)])
        return textField
    }()

    private let sendButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 32, height: 32))
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
        self.snp.makeConstraints { make in
            make.height.equalTo(88)
        }
    
        addSubview(messageTextField)
        addSubview(sendButton)

        messageTextField.snp.makeConstraints { make in
            make.trailing.leading.equalToSuperview().inset(16)
            make.bottom.equalToSuperview().inset(36)
            make.top.equalToSuperview().offset(12)
        }
        
        sendButton.snp.makeConstraints { make in
            make.trailing.equalTo(messageTextField).inset(4)
            make.centerY.equalTo(messageTextField)
        }

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
