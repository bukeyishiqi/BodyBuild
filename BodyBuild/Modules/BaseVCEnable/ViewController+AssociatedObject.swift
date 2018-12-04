//
//  ViewController+AssociatedObject.swift
//  iboss
//
//  Created by 陈琪 on 2018/6/28.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension UIViewController {
    /**
     * 上下拉刷新执行Block
     */
    typealias refresher = ((_ refresher: MJRefreshComponent) ->Void)?
    
    private struct cs_associatedKeys {
        // 刷新
        static let header  = UnsafeRawPointer.init(bitPattern: "cs_header".hashValue)
        static let footer  = UnsafeRawPointer.init(bitPattern: "cs_footer".hashValue)
        
    }
    
    // MARK: 刷新属性
    var refreshHeader: refresher {
        set {
            objc_setAssociatedObject(self, cs_associatedKeys.header!, newValue as AnyObject, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            if let complete = objc_getAssociatedObject(self, cs_associatedKeys.header!) as? refresher {
                return complete
            }
            return nil
        }
    }
    
    var refreshFooter: refresher {
        set {
            objc_setAssociatedObject(self, cs_associatedKeys.footer!, newValue as AnyObject, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            if let complete = objc_getAssociatedObject(self, cs_associatedKeys.footer!) as? refresher {
                return complete
            }
            return nil
        }
    }

}
