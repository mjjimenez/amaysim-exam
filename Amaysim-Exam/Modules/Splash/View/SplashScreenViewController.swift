//
//  SplashScreenViewController.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import UIKit

class SplashScreenViewController: UIViewController {

    var finishedPresentingSplash: (() -> ())?

    @IBOutlet weak var welcomeLabel: UILabel!

    var splashViewModel: SplashViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.welcomeLabel.text = splashViewModel.welcomeGreeting

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {

            self.finishedPresentingSplash?()

        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
