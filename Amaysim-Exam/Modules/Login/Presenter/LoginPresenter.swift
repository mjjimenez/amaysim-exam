//
//  LoginPresenter.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation
import UIKit

class LoginPresenter: LoginEventHandlerInterface, LoginInteractorOutputInterface {

    var loginInteractor: LoginInteractorInterface!
    weak var loginPresenterOutput: LoginPresenterOutputInterface?

    func didLogin(withMSN mobileSerialNumber: String, password: String) {
        self.loginInteractor.login(withMSN: mobileSerialNumber, password: password)
    }

    func receivedLoginResult(_ result: Result<AccountDocument>) {
        switch result {
        case .success(let accountDocument):
            print(accountDocument)
        case .failure(let error):
            if let error = error as? ErrorAlertPresentable {
                self.loginPresenterOutput?.presentErrorAlert(alert: UIAlertController.makeAlertController(from: error))
            }
        }
    }
}
