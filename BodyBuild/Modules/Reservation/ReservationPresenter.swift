//
//  ReservationPresenter.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/8.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ReservationPresenter: ReservationPresenterProtocol, ReservationInteractorOutputProtocol {

    weak private var view: ReservationViewProtocol?
    var interactor: ReservationInteractorInputProtocol?
    private let router: ReservationWireframeProtocol

    init(interface: ReservationViewProtocol, interactor: ReservationInteractorInputProtocol?, router: ReservationWireframeProtocol) {
        self.view = interface
        self.interactor = interactor
        self.router = router
    }

}