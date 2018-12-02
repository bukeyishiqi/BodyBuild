//
//  LoginRouter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/2.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class LoginRouter: LoginWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        let stroyb = UIStoryboard.init(name: "Main", bundle: nil)
        let view = stroyb.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        
        let interactor = LoginInteractor()
        let router = LoginRouter()
        let presenter = LoginPresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}