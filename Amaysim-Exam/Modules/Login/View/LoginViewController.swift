//
//  LoginViewController.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, LoginPresenterOutputInterface {

    var navigateToMainAccount: ((AccountDocument) -> ())?

    var loginEventHandler: LoginEventHandlerInterface!

    @IBOutlet weak var msnTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func tappedLogin(_ sender: Any) {
        if let mobileSerialNumber = msnTextField.text,
            let passwordText = passwordTextField.text {

            self.loginEventHandler.didLogin(withMSN: mobileSerialNumber, password: passwordText)

        }
    }

    func successfullyLoggedIn(with accountDocument: AccountDocument) {
        navigateToMainAccount?(accountDocument)
    }

    func presentErrorAlert(alert: UIAlertController) {
        self.present(alert, animated: true, completion: nil)
    }
    
}
