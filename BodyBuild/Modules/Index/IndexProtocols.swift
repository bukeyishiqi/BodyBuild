//
//  IndexProtocols.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/8.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import Foundation

//MARK: Wireframe -
protocol IndexWireframeProtocol: class {

}
//MARK: Presenter -
protocol IndexPresenterProtocol: class {

    var interactor: IndexInteractorInputProtocol? { get set }
}

//MARK: Interactor -
protocol IndexInteractorOutputProtocol: class {

    /* Interactor -> Presenter */
}

protocol IndexInteractorInputProtocol: class {

    var presenter: IndexInteractorOutputProtocol?  { get set }

    /* Presenter -> Interactor */
}

//MARK: View -
protocol IndexViewProtocol: class {

    var presenter: IndexPresenterProtocol?  { get set }

    /* Presenter -> ViewController */
}
