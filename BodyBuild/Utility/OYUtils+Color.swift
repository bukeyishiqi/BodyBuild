//
//  OYUtils+Color.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/12/5.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension UIColor {
    
    // MARK: - 颜色转换 IOS中十六进制的颜色转换为UIColor
    static func colorFromHexString(hex: String) -> UIColor {
        
        var  Str  = (hex as NSString).trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()
        
        if hex.hasPrefix("#"){
            Str=(hex as NSString).substring(from: 1)
        }
        
        let redStr = (Str as NSString ).substring(to: 2)
        let greenStr = ((Str as NSString).substring(from: 2) as NSString).substring(to: 2)
        let blueStr = ((Str as NSString).substring(from: 4) as NSString).substring(to: 2)
        
        var r:CUnsignedInt = 0, g:CUnsignedInt = 0, b:CUnsignedInt = 0;
        
        Scanner(string:redStr).scanHexInt32(&r)
        Scanner(string: greenStr).scanHexInt32(&g)
        Scanner(string: blueStr).scanHexInt32(&b)
        
        return UIColor(red: CGFloat(r)/255.0, green: CGFloat(g)/255.0, blue: CGFloat(b)/255.0, alpha: 1)
    }
    
}
