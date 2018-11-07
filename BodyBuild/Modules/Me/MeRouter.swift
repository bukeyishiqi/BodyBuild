//
//  MeRouter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/7.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MeRouter: MeWireframeProtocol {

    weak var viewController: UIViewController?

    static func createModule() -> UIViewController {
        // Change to get view from storyboard if not using progammatic UI
//        let view = MeViewController(nibName: nil, bundle: nil)
        let stroyb = UIStoryboard.init(name: "Main", bundle: nil)
        let view = stroyb.instantiateViewController(withIdentifier: "MeViewController") as! MeViewController
        let interactor = MeInteractor()
        let router = MeRouter()
        let presenter = MePresenter(interface: view, interactor: interactor, router: router)

        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view

        return view
    }
}
