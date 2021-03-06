//
//  SettiingPresenter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/8.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class SettiingPresenter: SettiingPresenterProtocol, SettiingInteractorOutputProtocol {

    weak private var view: SettiingViewProtocol?
    var interactor: SettiingInteractorInputProtocol?
    private let router: SettiingWireframeProtocol

    init(interface: SettiingViewProtocol, interactor: SettiingInteractorInputProtocol?, router: SettiingWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}
