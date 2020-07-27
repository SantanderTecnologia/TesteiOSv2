//
//  Strings.swift
//  SantanderTest
//
//  Created by Maria Eugênia Pereira Teixeira on 25/07/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

struct Strings {
    struct Error {
        static let alertTitle = NSLocalizedString("alert_title", comment: "")
        static let invalidPassword = NSLocalizedString("invalid_password", comment: "")
        static let emptyFields = NSLocalizedString("empty_fields", comment: "")
    }
     struct Login {
        struct Placeholder {
            static let loginUser = NSLocalizedString("login_user", comment: "")
            static let loginPassword = NSLocalizedString("login_password", comment: "")
        }
        struct Button {
            static let loginButton = NSLocalizedString("login_button", comment: "")
        }
    }
    struct Statment {
        struct Header {
            static let accountLabel = NSLocalizedString("account_label", comment: "")
            static let balanceLabel = NSLocalizedString("balance_label", comment: "")
        }
        struct Section {
            static let sectionTitle = NSLocalizedString("section_title", comment: "")
        }
    }
}
