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
    case `default`(options: ThemeProtocol)
}


public class ThemeService {
    
    static let share: ThemeService = {
        return ThemeService()
    }()
    
    init() {
        // 执行runtime方法替换
        self.doSwizzled()
    }
    
    var configType: ThemeConfigType!
    
    /** 设置主题类型*/
    public func setThemeConfigType(type: ThemeConfigType) {
        configType = type
    }
    
}


extension ThemeService {
    // MARK: 设置Controller
    public func configControllerStyle(_ controller: UIViewController) {
        if controller.themChangeHandler == nil {
            controller.themChangeHandler = { (options) -> Void in
                
                controller.view.backgroundColor = options.viewBackgroundColor
            }
        }
    }
    
    // MARK: 设置导航栏
    public func configNavigationBarStyle() {
    
    }
}
