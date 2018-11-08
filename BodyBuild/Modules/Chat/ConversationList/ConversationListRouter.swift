//
//  ConversationListRouter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/7.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConversationListRouter: ConversationListWireframeProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let stroyb = UIStoryboard.init(name: "Chat", bundle: nil)
        let view = stroyb.instantiateViewController(withIdentifier: "ConversationListViewController") as! ConversationListViewController
        
//        let view = ConversationListViewController(nibName: nil, bundle: nil)
        
        let interactor = ConversationListInteractor()
        let router = ConversationListRouter()
        let presenter = ConversationListPresenter(interface: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        
        return view
    }
}
