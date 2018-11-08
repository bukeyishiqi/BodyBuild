//
//  OYUtils+CGHelper.swift
//  RxChat
//
//  Created by 陈琪 on 2017/8/7.
//  Copyright © 2017年 Carisok. All rights reserved.
//

import Foundation
import UIKit


//! 当前设备frame
let CURRENT_APP_FRAME = UIScreen.main.bounds

let SCREEN_HEIGHT = CURRENT_APP_FRAME.height
let SCREEN_WIDTH = CURRENT_APP_FRAME.width
let SCREEN_PROPORTION = SCREEN_WIDTH / 640





extension OYUtils {

    class func screenScale() -> CGFloat {
        let _scale: CGFloat = {
            return UIScreen.main.scale
        }()
        
        return _scale
    }

    class func screenFrame() -> CGRect {
        return UIScreen.main.bounds
    }
    
    class func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }

    class func screenHeigth() -> CGFloat {
        return UIScreen.main.bounds.height
    }
    
    class func viewBx(_ view : UIView) -> CGFloat{
        return (view.frame.origin.x + view.frame.size.width)
    }
    
    class func viewBy(_ view : UIView) -> CGFloat{
        return (view.frame.origin.y + view.frame.size.height)
    }
    
    class func viewH(_ view : UIView) -> CGFloat {
        return view.frame.size.height
    }
    
    /** 导航栏＋状态栏高度 20这个值不能使用AppStatusBarHeight替换因为热点和电话中 */
    class func NaviBarAndStatusBarHeight() -> CGFloat {
        return CGFloat((44 + (isIPhoneX() ? 44 : 20)))
    }
    
    class func pixelAlignForFloat(_ position: CGFloat) -> CGFloat {
        let scale = OYUtils.screenScale()
        return round(position * scale) / scale
    }
    
    
}
