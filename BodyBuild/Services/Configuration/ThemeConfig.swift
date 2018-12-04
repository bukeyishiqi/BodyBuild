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
class ThemeConfigService {

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
extension ThemeConfigService {

    func RGBCOLOR(r: CGFloat, g: CGFloat, b: CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: 1)
    }
    
    func RGBACOLOR(r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) -> UIColor {
        return UIColor.init(red: (r)/255.0, green: (g)/255.0, blue: (b)/255.0, alpha: a)
    }
    
    /** 控制器页面背景颜色*/
    var vcBackgroundColor: UIColor {
        return UIColor.white
    }
    
    /** TableView页面背景颜色*/
    var tableViewBackgroundColor: UIColor {
        return UIColor.white
    }
}


// MARK: 项目字体大小配置
extension ThemeConfigService {
    
    /** 自定义字体大小*/
    func FCFont(_ fontSize : CGFloat) -> UIFont { 
        if fontSize > 30 || fontSize < 10 {
            return UIFont.init(name: "Helvetica", size: 12.0)!
        }
        return UIFont.init(name: "Helvetica", size: fontSize)!
    }
}
