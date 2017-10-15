//
//  LoginMocks.swift
//  Amaysim-ExamTests
//
//  Created by Mark Jeremiah Jimenez on 16/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

class LoginInteractorOutputMock: LoginInteractorOutputInterface {

    var loginSucceeded: Bool!

    func receivedLoginResult(_ result: Result<AccountDocument>) {
        switch result {
        case .success(_):
            loginSucceeded = true
        case .failure(_):
            loginSucceeded = false
        }
    }
}
