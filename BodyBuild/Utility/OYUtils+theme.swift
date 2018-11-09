//
//  OYUtils+theme.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/11/9.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation

/// UIColor,通过 RGBA数值设置颜色
///
/// - Parameters:
///   - red: 红色值
///   - green: 绿色值
///   - blue: 蓝色值
///   - alpha: 透明度
/// - Returns:  UIColor
func colorWithRGBA(_ red : CGFloat,_ green : CGFloat , _ blue : CGFloat,_ alpha : CGFloat) -> UIColor{
    
    return UIColor(red: colorValue(red), green: colorValue(green), blue: colorValue(blue), alpha: alpha)
}

func colorValue(_ value : CGFloat) -> CGFloat {
    return value / 255.0
}

extension OYUtils {
    // 常规字体
    static func FontSize(_ size : CGFloat) -> UIFont {
        
        return UIFont.systemFont(ofSize: OYUtils.AdaptW(size))
    }
    
    // 加粗字体
    static func BoldFontSize(_ size : CGFloat) -> UIFont {
        
        return UIFont.boldSystemFont(ofSize: OYUtils.AdaptW(size))
    }

}
