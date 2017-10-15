//
//  AccountViewController.swift
//  Amaysim-Exam
//
//  Created by Mark Jeremiah Jimenez on 15/10/2017.
//  Copyright © 2017 Mark Jeremiah Jimenez. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dataBalanceLabel: UILabel!
    @IBOutlet weak var subscriptionNameLabel: UILabel!
    @IBOutlet weak var subscriptionPriceLabel: UILabel!
    @IBOutlet weak var expirationDateLabel: UILabel!

    var accountViewModel: AccountViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.nameLabel.text = self.accountViewModel.nameText
        self.dataBalanceLabel.text = self.accountViewModel.dataBalanceText
        self.subscriptionNameLabel.text = self.accountViewModel.productNameText
        self.subscriptionPriceLabel.text = self.accountViewModel.productPriceText
        self.expirationDateLabel.text = self.accountViewModel.expirationDateText
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
