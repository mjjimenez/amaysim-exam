//
//  LoginModuleInterface.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation
import UIKit

protocol LoginEventHandlerInterface: class {
    func didLogin(withMSN mobileSerialNumber: String, password: String)
}

protocol LoginPresenterOutputInterface: class {
    func presentErrorAlert(alert: UIAlertController)
    func successfullyLoggedIn(with accountDocument: AccountDocument)
}

protocol LoginInteractorInterface {
    func login(withMSN mobileSerialNumber: String, password: String)
}

protocol LoginInteractorOutputInterface: class {
    func receivedLoginResult(_ result: Result<AccountDocument>)
}
