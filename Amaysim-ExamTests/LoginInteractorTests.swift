//
//  LoginInteractorTests.swift
//  Amaysim-ExamTests
//
//  Created by Mark Jeremiah Jimenez on 16/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import XCTest
@testable import Amaysim_Exam

class LoginInteractorTests: XCTestCase {

    var loginInteractor: LoginInteractor!

    override func setUp() {
        super.setUp()

        loginInteractor = LoginInteractor()
    }
    
    func testBothEmptyFields() {

        let loginInteractorOutputMock = LoginInteractorOutputMock()

        loginInteractor.loginInteractorOutput = loginInteractorOutputMock
        loginInteractor.login(withMSN: "", password: "")

        XCTAssertFalse(loginInteractorOutputMock.loginSucceeded)

    }

    func testMSNEmpty() {

        let loginInteractorOutputMock = LoginInteractorOutputMock()

        loginInteractor.loginInteractorOutput = loginInteractorOutputMock
        loginInteractor.login(withMSN: "", password: "asdasdf")

        XCTAssertFalse(loginInteractorOutputMock.loginSucceeded)

    }

    func testPasswordEmpty() {

        let loginInteractorOutputMock = LoginInteractorOutputMock()

        loginInteractor.loginInteractorOutput = loginInteractorOutputMock
        loginInteractor.login(withMSN: "", password: "asdasdf")

        XCTAssertFalse(loginInteractorOutputMock.loginSucceeded)

    }

    func testInvalidMSN() {

        let loginInteractorOutputMock = LoginInteractorOutputMock()

        loginInteractor.loginInteractorOutput = loginInteractorOutputMock
        loginInteractor.login(withMSN: "xxxxx", password: "asdfasdf")

        XCTAssertFalse(loginInteractorOutputMock.loginSucceeded)
    }

    func testValidCredentials() {

        let loginInteractorOutputMock = LoginInteractorOutputMock()

        loginInteractor.loginInteractorOutput = loginInteractorOutputMock
        loginInteractor.login(withMSN: "0468874507", password: "asdfasdf")

        XCTAssertTrue(loginInteractorOutputMock.loginSucceeded)

    }
}
