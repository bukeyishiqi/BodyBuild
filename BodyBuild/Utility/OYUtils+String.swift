//
//  OYUtils+String.swift
//  iboss
//
//  Created by 陈琪 on 2018/7/3.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import UIKit


extension Double {
    public func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension String {
    /** 设置字符串各段颜色*/
    func setStringColor(subString: NSString, color: UIColor) -> NSMutableAttributedString {
        let attributeString = NSMutableAttributedString.init(string: self as String)
        let range = (self as NSString).range(of: subString as String)
        attributeString.setAttributes([NSAttributedString.Key.foregroundColor: color], range: range)
        return attributeString
    }
    
    /** 四舍五入*/
    func decimalwithFormat(_ format: String? = "0.00") -> String {
        let value = (self as NSString).doubleValue
        return "\(value.roundTo(places: 2))"   // 保留两位小数
    }
}





