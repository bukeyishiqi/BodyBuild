//
//  OYUtils+ImageView.swift
//  iboss
//
//  Created by 陈琪 on 2018/6/25.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation
import Kingfisher

extension OYUtils {
    static func loadImageView(imageView: UIImageView, url: String, placeholder: String? = nil) {
        imageView.kf.setImage(with: ImageResource(downloadURL: NSURL.init(string: url)! as URL), placeholder: UIImage.init(named: placeholder ?? ""), options: nil, progressBlock: nil, completionHandler: nil)
    }
}

