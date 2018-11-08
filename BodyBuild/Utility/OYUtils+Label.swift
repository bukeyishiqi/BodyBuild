//
//  OYUtils+Label.swift
//  iboss
//
//  Created by 陈琪 on 2018/7/3.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension UILabel {
    func setStrikethroughLine(range: NSRange, color: UIColor, fontSize: CGFloat) {
        let attribs = [NSAttributedString.Key.strikethroughStyle: NSNumber.init(value: 1),
                       NSAttributedString.Key.foregroundColor: color,
                       NSAttributedString.Key.font: UIFont.systemFont(ofSize: fontSize)]
        
        let attribString = NSMutableAttributedString.init(string: self.text!)
        attribString.addAttributes(attribs, range: range)
        
        self.numberOfLines = 0
        self.attributedText = attribString
    }
}
