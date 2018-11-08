//
//  OYUtils+Regex.swift
//  iboss
//
//  Created by 陈琪 on 2018/9/12.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


// MARK: 正则表达式匹配
extension OYUtils {
    /** 匹配金额输入小数点后两位*/
    static func isValidAmount(amount: String, regex: String? = nil) -> Bool {
        
        let expression: String
        if regex != nil {
            expression = regex!
        } else {
          expression  = "^([-]?([0-9]*))((\\.)[0-9]{0,2})?$"
        }
        
        let regex = try! NSRegularExpression(pattern: expression, options: NSRegularExpression.Options.allowCommentsAndWhitespace)
        let numberOfMatches = regex.numberOfMatches(in: amount, options:NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, (amount as NSString).length))
        
        return numberOfMatches != 0
    }
}
