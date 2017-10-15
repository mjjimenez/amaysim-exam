//
//  AppCoordinator.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator {
    func start()
}

class AppCoordinator: Coordinator {


    let window: UIWindow
    let storyboard = UIStoryboard(name: "Main", bundle: nil)

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        self.window.rootViewController = self.createLoginViewController()
        self.window.makeKeyAndVisible()
    }

    func createLoginViewController() -> LoginViewController {
        return self.storyboard.instantiateViewController(withIdentifier: "Login") as! LoginViewController
    }

}
