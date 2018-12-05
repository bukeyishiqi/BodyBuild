//
//  ThemeProtocol.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/4.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


public protocol ThemeProtocol {
    /* 页面背景颜色*/
    var viewBackgroundColor: UIColor { get }
    /* TableView背景颜色*/
    var tableViewBackgroundColor: UIColor { get }    
    
    // MARK: 导航栏
    var navigationBarTextColor: UIColor { get set }
    var NavigationBarTintColor: UIColor { get set }
    var NavigationBarBarTintColor: UIColor { get set }
}
