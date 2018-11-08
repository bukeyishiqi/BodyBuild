//
//  OYUtils+Swizzled.swift
//  iboss
//
//  Created by 陈琪 on 2018/7/19.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension OYUtils {
    static func methodSwizzled(original: Selector, swizzled: Selector, originalClass: AnyClass) {
        
        let originalSelector = original
        let swizzledSelector = swizzled
        
        let originalMethod = class_getInstanceMethod(originalClass, originalSelector)
        
        guard let swizzledMethod = class_getInstanceMethod(originalClass, swizzledSelector) else {
            return
        }
        
        let didAddMethod = class_addMethod(originalClass, originalSelector, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod))
        
        if didAddMethod {
            class_replaceMethod(originalClass, swizzledSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        } else {
            method_exchangeImplementations(originalMethod!, swizzledMethod)
        }
        
    }
}
