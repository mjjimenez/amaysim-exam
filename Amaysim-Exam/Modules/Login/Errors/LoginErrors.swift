//
//  LoginErrors.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

enum LoginError: Error {
    case invalidMSN
    case incompleteLoginFields
    case resourceLoadingError
}

extension LoginError: ErrorAlertPresentable {
    var title: String {
        return "Login Error"
    }

    var message: String {
        switch self {
        case .invalidMSN:
            return "Could not find a record of your mobile serial number"
        case .incompleteLoginFields:
            return "Please complete all fields."
        case .resourceLoadingError:
            return "Could not successfully load your account."
        }
    }
}
