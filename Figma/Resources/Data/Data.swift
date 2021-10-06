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

    static let names = ["Jessica Thompson", "Kat Williams", "Jacob Washington", "Leslie Alexander", "Tony Monta"]

    static let messages = ["Hey you! Are u there?", "OMG! OMG! OMG!", "Sure. Sunday works for me!", "Sent you an invite for next monday.", "How’s Alicia doing? Ask her to give mу somebody once told me"]

    static let times = ["4h ago", "5h ago", "20/9/21", "19/9/21", "19/9/21"]

    static let pinnedProfileImages: [UIImage?] = [
        UIImage(named: "Profile1"),
        UIImage(named: "Profile2"),
        UIImage(named: "Profile3")
    ]

    static let pinnedNames = ["Kim", "Steve", "Mia"]
}
