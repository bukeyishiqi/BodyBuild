//
//  ThemeService+AssociatedObject.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/4.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension UIViewController {

    /**
     * 主题配置执行Block
     */
    typealias ThemeChangeHandler = ((_ options: ThemeProtocol) -> Void)?
    
    
    private struct cs_associatedKeys {
        // 主题
        static let theme = UnsafeRawPointer.init(bitPattern: "cs_theme".hashValue)
    }
    
    // MARK: 主题
    var themChangeHandler: ThemeChangeHandler {
        set {
//            guard let value = newValue else{
//                return
//            }
            objc_setAssociatedObject(self, cs_associatedKeys.theme!, newValue as AnyObject, .OBJC_ASSOCIATION_COPY_NONATOMIC)

//            let dealObject: AnyObject = unsafeBitCast(value, to: AnyObject.self)
//            objc_setAssociatedObject(self, cs_associatedKeys.theme!,dealObject,objc_AssociationPolicy.OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            //设置KVO监听
            self.kvoController.observe(ThemeService.share, keyPath: "styleDescription", options: [.initial,.new] , block: {[weak self] (nav, obj, change) -> Void in
                    self?.themChangeHandler?(ThemeService.share.themeOptions)
                }
            )
        }
        get {
            if let themeHandler = objc_getAssociatedObject(self, cs_associatedKeys.theme!) as? ThemeChangeHandler {
                return themeHandler
            }
            return nil
        }
    }
}
