//
//  Data.swift
//  Figma
//
//  Created by Никита Ляпустин on 03.10.2021.
//

import UIKit

class Data {

    // MARK: - Type Properties

    static let profileImages: [UIImage?] = [
        UIImage(named: "Profile1"),
        UIImage(named: "Profile2"),
        UIImage(named: "Profile3"),
        nil,
        UIImage(named: "Profile4")
    ]

    static let names = ["Jessica Thomawdawaskljdhaksjdhalkjshdlakjhdawdeawdawpson", "Kat Williams", "Jacob Washington", "Leslie Alexander", "Tony Monta"]

    static let messages = ["Hey you! Are u there?", "OMG! OMG! OMG!", "Sure. Sunday works for me!", "Sent you an invite for next monday.", "How’s Alicia doing? Ask her to give mу somebody once told me"]

    static let times = ["4h ago", "5h ago", "20/9/21", "19/9/21", "19/9/21"]

    static let pinnedProfileImages: [UIImage?] = [
        UIImage(named: "Profile1"),
        UIImage(named: "Profile2"),
        UIImage(named: "Profile3")
    ]

    static let pinnedNames = ["Kim", "Steve", "Mia"]

    static var messageSections = [
        MessageSection(messages:
                        [
                            Message(text: "Alex, let’s meet this weekend. I’ll check with Dave too 😎", time: "8:27 PM", isOutgoing: false),
                            Message(text: "Sure. Let’s aim for saturday", time: "8:56 PM", isOutgoing: true),
                            Message(text: "I’m visiting mom this sunday 👻", time: "8:56 PM", isOutgoing: true),
                            Message(text: "Alrighty! Will give you a call shortly 🤗", time: "9:01 PM", isOutgoing: false),
                            Message(text: "❤️", time: "9:04 PM", isOutgoing: true)
                        ],
                       date: "SEP 14, 2021"),
        MessageSection(messages:
                        [
                            Message(text: "Hey you! Are you there?", time: "11:53 AM", isOutgoing: false),
                            Message(text: "👋 Hi Jess! What’s up?", time: "12:14 PM", isOutgoing: true)
                        ],
                       date: "TODAY")
    ]
    
}

struct MessageSection {
    var messages: [Message]
    let date: String
}

struct Message {
    let text: String
    let time: String
    let isOutgoing: Bool
}
