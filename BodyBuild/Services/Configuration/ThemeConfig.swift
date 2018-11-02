//
//  ThemeConfig.swift
//  MallMobile
//
//  Created by 陈琪 on 2016/12/27.
//  Copyright © 2016年 Carisok. All rights reserved.
//

import Foundation
import UIKit

enum ThemeType {
    /** 常用*/
    case normal
}

/**
 *  主题配置类
 */
class ThemeConfig: NSObject {

    var type: ThemeType
    
    init(themeType type: ThemeType) {
        self.type = type
    }
    
    // MARK: 项目图片配置
    func imageWithName(name: String?) -> UIImage? {
        
        guard let name = name else {
            return UIImage()
        }
        
        let prefix:String
        
        switch type {
        case .normal:
            prefix = "default_"
        }
        let newName  = prefix+name
        let image = UIImage.init(named: newName)
        
        return image
    }

}


// MARK: 项目颜色配置
@objc extension ThemeConfig {

    func RGBCOLOR(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1)
    }
    
    func RGBACOLOR(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
    }
    
    /** 控制器页面背景颜色*/
    var vcBackgroundColor: UIColor {
        return FCColor02()
    }
    
    /** TableView页面背景颜色*/
    var tableViewBackgroundColor: UIColor {
        return FCColor02()
    }
    
    
    /** 白色（部分字体颜色、模块背景色）*/
    func FCColor01() -> UIColor{
        return kCyColorFromHex(hex: 0xFFFFFF)
    }
    /** 浅灰（页面背景底色）*/
    func FCColor02() -> UIColor{
        return kCyColorFromHex(hex: 0xE5E5E5) // @"color02"
    }
    /** 所有分割线颜色（1px）*/
    func FCColor03() -> UIColor{
        return kCyColorFromHex(hex: 0xDEDEDE)
    }
    /** 灰色（次要的辅助字体、提示性文字、失效文字）*/
    func FCColor04() -> UIColor{
        return kCyColorFromHex(hex: 0x999999)
    }
    /** 灰色（部分模块背景色）*/
    func FCColor05() -> UIColor{
        return kCyColorFromHex(hex: 0xCBCBCB)
    }
    /** 深灰（辅助颜色、默认状态文字）*/
    func FCColor06() -> UIColor{
        return kCyColorFromHex(hex: 0x666666)
    }
    /** 黑色（标题、正文、部分金额等主要文字）*/
    func FCColor07() -> UIColor{
        return kCyColorFromHex(hex: 0x3B3B3B)
    }
    /** 红色（商城色系、重要醒目文字）*/
    func FCColor08() -> UIColor{
        return kCyColorFromHex(hex: 0xe60014)
    }
    /** 橘色（部分醒目文字、价格文字）*/
    func FCColor09() -> UIColor{
        return kCyColorFromHex(hex: 0xFF6600)
    }
    /**  深蓝（电话号码等链接、可点控文字）*/
    func FCColor10() -> UIColor{
        return kCyColorFromHex(hex: 0x3268CC)
    } 
    /**  绿色（门店色系、小面积按钮、icon）*/
    func FCColor11() -> UIColor{
        return kCyColorFromHex(hex: 0x39AC69)
    }
    /**  浅蓝（师傅色系、小面积按钮、icon）*/
    func FCColor12() -> UIColor{
        return kCyColorFromHex(hex: 0x1D9EE0)
    }
    /**  红色（快手色系、小面积按钮、icon）*/
    func FCColor13() -> UIColor{
        return kCyColorFromHex(hex: 0xFC2D2D)
    }
    
    private func kCyColorFromHex(hex: Int) -> UIColor{
        return UIColor.init(red: (CGFloat((hex & 0xff0000) >> 16) / 255.0), green: (CGFloat((hex & 0x00ff00) >> 8) / 255.0), blue: (CGFloat(hex & 0x0000ff) / 255.0), alpha: 1)
    }
}


// MARK: 项目字体大小配置
extension ThemeConfig {
    /** 少数重要标题、提示文字 17*/
    func FCFont01() -> UIFont {
        return UIFont.init(name: "Helvetica", size: 17.0)!
    }
    /** 用在操作按钮、列表标题 14*/
    func FCFont02() -> UIFont {
        return UIFont.init(name: "Helvetica", size: 14.0)!
    }
    /** 用在普通文字 12*/
    func FCFont03() -> UIFont {
        return UIFont.init(name: "Helvetica", size: 12.0)!
    }
    /** 备注性文字、时间、评价 11*/
    func FCFont04() -> UIFont {
        return UIFont.init(name: "Helvetica", size: 11.0)!
    }
    /** 自定义字体大小*/
    func FCFont(_ fontSize : CGFloat) -> UIFont { 
        if fontSize > 30 || fontSize < 10 {
            return UIFont.init(name: "Helvetica", size: 12.0)!
        }
        return UIFont.init(name: "Helvetica", size: fontSize)!
    }
}
