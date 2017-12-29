//
//  AuthPinViewController.swift
//  ARGame
//
//  Created by Aleksandr on 21/11/2017.
//  Copyright © 2017 Aleksandr. All rights reserved.
//

import UIKit

class AuthPinViewController: UIViewController {

    var verificationID: String?
    var completion: ((_ success: Bool) -> Void)?

    @IBOutlet weak var codeLabel: UILabel! {
        didSet {
            codeLabel.text = "328556"
            codeLabel.textAlignment = .center
        }
    }
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.setTitle("pin_button_done".lcd, for: .normal)
            doneButton.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        }
    }
    
    deinit {
       print("")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "pin_title".lcd
        view.backgroundColor = .yellow
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Actions
    @objc func donePressed () {
        completion?(true)
    }
}
