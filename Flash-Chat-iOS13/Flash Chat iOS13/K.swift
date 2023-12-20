//
//  Identifire.swift
//  Flash Chat iOS13
//
//  Created by Nikita on 19.12.2023.
//  Copyright © 2023 Angela Yu. All rights reserved.
//

import Foundation

struct K {
    
    static let cellIdentifier = "ReusableCell"
    static let cellNibName = "MessageCell"
    static let register = "register"
    static let login = "login"
    static let appName = "⚡️ Flash chat"
    
    struct BrandColors {
        static let purple = "BrandPurple"
        static let lightPurple = "BrandLightPurple"
        static let blue = "BrandBlue"
        static let lighBlue = "BrandLightBlue"
    }
    
    struct FStore {
        static let collectionName = "messages"
        static let senderField = "sender"
        static let bodyField = "body"
        static let dateField = "date"
    }
}
