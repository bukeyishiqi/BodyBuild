//
//  ThemeOptions.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/4.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


public struct ThemeOptions: ThemeProtocol {
    
    public var viewBackgroundColor: UIColor = UIColor.white
    
    public var tableViewBackgroundColor = UIColor.white
    
    public var navigationBarTextColor: UIColor = UIColor.colorFromHexString(hex: "3b3a3a")
    
    public var NavigationBarTintColor: UIColor = UIColor.colorFromHexString(hex: "3b3a3a")
    
    public var NavigationBarBarTintColor: UIColor = UIColor.colorFromHexString(hex: "f9f9f9")
}
