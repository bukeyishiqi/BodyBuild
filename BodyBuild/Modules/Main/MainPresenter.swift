//
//  MainPresenter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/5.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainPresenter: MainPresenterProtocol, MainInteractorOutputProtocol {

    weak private var view: MainViewProtocol?
    var interactor: MainInteractorInputProtocol?
    private let router: MainWireframeProtocol

    init(interface: MainViewProtocol, interactor: MainInteractorInputProtocol?, router: MainWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
