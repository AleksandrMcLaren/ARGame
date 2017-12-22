//
//  AuthPhoneViewController.swift
//  ARGame
//
//  Created by Aleksandr on 21/11/2017.
//  Copyright © 2017 Aleksandr. All rights reserved.
//

import UIKit

protocol AuthPhoneViewPresentation: class {
    func getData() -> String?
}

class AuthPhoneViewController: UIViewController, AuthPhoneViewPresentation {
    
    var presenter: AuthPhonePresentation?

    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var bottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var phoneField: UITextField! {
        didSet {
            phoneField.keyboardType = .phonePad
        }
    }
    @IBOutlet weak var doneButton: UIButton! {
        didSet {
            doneButton.setTitle("Done", for: .normal)
            doneButton.addTarget(self, action: #selector(donePressed), for: .touchUpInside)
        }
    }
    
    deinit {
        print("")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        addKeyboardObserver()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        removeKeyboardObserver()
    }

    // MARK: - Configure
    func configureViews () {
        title = "Phone"
        view.backgroundColor = .white

        let tap = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        view.addGestureRecognizer(tap)
    }
    
    // MARK: - Actions
    @objc func donePressed() {
        endEditing()
        presenter?.donePressed()
    }
    
    @objc func viewTapped() {
        endEditing()
    }
    
    func endEditing() {
        view.endEditing(true)
    }
    
    // MARK: - Data
    func getData() -> String? {
        return ""
    }
}

extension AuthPhoneViewController: KeyboardObserverProtocol {
    
    @objc func keyboardWillChangeFrame(notification: NSNotification) {
        
        if let keyboardFrame = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = stackView.frame.size.height - keyboardFrame.origin.y + stackView.frame.origin.y

            bottomConstraint.constant += keyboardHeight
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}
