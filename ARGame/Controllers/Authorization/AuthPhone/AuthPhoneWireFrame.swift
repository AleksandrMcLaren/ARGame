//
//  AuthPhoneFacade.swift
//  ARGame
//
//  Created by Aleksandr on 23/11/2017.
//  Copyright © 2017 Aleksandr. All rights reserved.
//

import UIKit

protocol AuthPhoneWireFramePresentation: class {
    func createModule() -> UIViewController
    var moduleCompletion: (() -> Void)? { get set }
}

protocol AuthPhonePresenterOutput: class {
    func presenterCompletion()
}

class AuthPhoneWireFrame: AuthPhoneWireFramePresentation {
    
    var moduleCompletion: (() -> Void)?

    deinit {
        
    }
    
    func createModule() -> UIViewController {
        
        let viewController: AuthPhoneViewController = AuthPhoneViewController.loadFromNib()
        let presenter = AuthPhonePresenter()
        let interactor = AuthPhoneInteractor()
        
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wareFrame = self

        viewController.presenter = presenter
        
        interactor.output = presenter
        
        return viewController
    }
}

extension AuthPhoneWireFrame: AuthPhonePresenterOutput {
    
    func presenterCompletion() {
        moduleCompletion?()
    }
}
