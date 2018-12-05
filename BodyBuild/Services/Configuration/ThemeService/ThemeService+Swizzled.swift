//
//  ThemeService+Swizzled.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/4.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


private var hasSwizzled = false
private let prefix = "oy"

extension ThemeService {
    func doSwizzled() {
        guard !hasSwizzled else { return }
        hasSwizzled = true
        
        var selector = [String: [(Selector, Selector)]]()
        
        // 添加替换方法
        selector[NSStringFromClass(UIViewController.self)] = UIViewController.swizzledMethods
        
        // 方法转换
        selector.forEach {
            let className = $0
            $1.forEach {
                OYUtils.methodSwizzled(original: $0, swizzled: $1, originalClass: NSClassFromString(className)!)
            }
        }
    }
}


extension UIViewController {
    
    static var swizzledMethods: [(Selector, Selector)] {
        return [(#selector(UIViewController.viewDidLoad),             #selector(UIViewController.oy_viewDidLoad))]
    }
    
    @objc open func oy_viewDidLoad(){
        self.oy_viewDidLoad()
        // 统一配置主题,赋值主题配置Block
        ThemeService.share.configControllerStyle(self)
    }
}
