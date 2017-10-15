//
//  LoginInteractor.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation

class LoginInteractor: LoginInteractorInterface {

    weak var loginInteractorOutput: LoginInteractorOutputInterface?

    func login(withMSN mobileSerialNumber: String, password: String) {

        if mobileSerialNumber.isEmpty || password.isEmpty {
            self.loginInteractorOutput?.receivedLoginResult(.failure(LoginError.incompleteLoginFields))
        } else {

            if let collectionResourceURL = Bundle.main.url(forResource: "collection", withExtension: "json") {

                do {

                    let collectionData = try Data(contentsOf: collectionResourceURL)
                    //Parse collection data into JSON
                    let decoder = JSONDecoder()
                    let accountDocument = try decoder.decode(AccountDocument.self, from: collectionData)

                    self.validateMSN(msn: mobileSerialNumber, accountDocument: accountDocument)

                } catch {

                    self.loginInteractorOutput?.receivedLoginResult(.failure(LoginError.resourceLoadingError))

                }

            } else {
                self.loginInteractorOutput?.receivedLoginResult(.failure(LoginError.resourceLoadingError))
            }
        }

    }

    func validateMSN(msn: String, accountDocument: AccountDocument) {

        if msn == accountDocument.service?.msn {
            self.loginInteractorOutput?.receivedLoginResult(.success(accountDocument))
        } else {
            self.loginInteractorOutput?.receivedLoginResult(.failure(LoginError.invalidMSN))
        }
    }

}
