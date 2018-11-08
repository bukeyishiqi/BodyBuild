//
//  OYUtils+Device.swift
//  iboss
//
//  Created by 陈琪 on 2018/6/25.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import UIKit


extension OYUtils {
    // MARK: 判断是否iPhone X
   class func isIPhoneX() -> Bool {
        if UIScreen.main.bounds.height == 812 {
            return true
        }
        return false
    }
    
    // MARK: 获取安全区域的间距（适配iPhone X）
    class func getSafeAreaMargin() -> CGFloat {
        if isIPhoneX() {
            return 34.0
        }
        return 0.0
    }
    
    class func getNavigatorHeight() -> CGFloat {
        if isIPhoneX() {
            return 88.0
        }
        return 64.0
    }

}
