//
//  Extensions.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    static func makeAlertController(from error: ErrorAlertPresentable) -> UIAlertController {

        let dismissAlertAction = UIAlertAction(title: "Ok", style: .cancel)
        let alertController = UIAlertController(title: error.title, message: error.message, preferredStyle: .alert)

        alertController.addAction(dismissAlertAction)

        return alertController

    }
}
