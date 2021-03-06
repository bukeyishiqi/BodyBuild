//
//  MainViewController.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/5.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class MainViewController: UITabBarController, MainViewProtocol {

	var presenter: MainPresenterProtocol?

	override func viewDidLoad() {
        super.viewDidLoad()
        configTabBar()
    }

    private func configTabBar() {
        let titles = ["首页", "消息", "预约", "我的"]
        let images = ["tabLive", "tabYule", "tabFocus", "tabYuba"]
        let selectImages = ["tabLiveHL", "tabYuleHL", "tabFocusHL", "tabYubaHL"]
        
        for index in 0..<titles.count {
            setChildController(controller: self.viewControllers![index], title: titles[index], image: images[index], selectImage: selectImages[index])
        }
    }
    
    private func setChildController(controller: UIViewController, title: String, image: String, selectImage: String) {
        controller.tabBarItem.title = title
        controller.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -3)
        controller.tabBarItem.image = UIImage.init(named: image)
        controller.tabBarItem.selectedImage = UIImage.init(named: selectImage)
    }
}
