//
//  ThemeService.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/4.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation

/**
 *  主题类型，关联主题协议
 */
public enum ThemeConfigType {
    /** 默认*/
    case `default`
    /** 自定义*/
    case custom(options: ThemeProtocol)
}


public class ThemeService: NSObject {
    
    static let share: ThemeService = {
        return ThemeService()
    }()
    
    override init() {
        super.init()

        // 执行runtime方法替换
        self.doSwizzled()
    }
    
    /** 主题设置数据项*/
    var themeOptions: ThemeProtocol!
    
    @objc dynamic var styleDescription: String!

    /** 设置主题类型*/
    public func setThemeConfigType(type: ThemeConfigType) {
        switch type {
        case .default:
            themeOptions = ThemeOptions()
            styleDescription = "Default"
            break
        case .custom(options: let option):
            themeOptions = option
            styleDescription = "Custom"
            break
        }
    }
    
}


extension ThemeService {
    // MARK: 设置Controller
    public func configControllerStyle(_ controller: UIViewController) {
        print("** 设置控制器颜色**")
        if controller.themChangeHandler == nil {
            controller.themChangeHandler = {[weak self] (options) -> Void in
                
                controller.view.backgroundColor = options.viewBackgroundColor
                
                self?.configNavigationBarStyle()
            }
        }
    }
    
    // MARK: 设置导航栏
    public func configNavigationBarStyle() {
        
        UINavigationBar.appearance().tintColor = themeOptions.NavigationBarTintColor
        UINavigationBar.appearance().barTintColor = themeOptions.NavigationBarBarTintColor
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: themeOptions.navigationBarTextColor]
        UINavigationBar.appearance().isTranslucent = false
        
    }
}
