//
//  AppInformation.swift
//  MallMobile
//
//  Created by 陈琪 on 16/10/26.
//  Copyright © 2016年 Carisok. All rights reserved.
//

import Foundation
import UIKit

// MARK: 系统信息数据

struct AppInformation {

    // MARK: app版本
    var version: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleVersionKey as String) as! String
    }
    
    // MARK: bundle 版本
    var bundleVersion: String {
        return Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
    }
    
    // MARK: app 名称
    var appName: String {
        return Bundle.main.object(forInfoDictionaryKey: kCFBundleNameKey as String) as! String
    }
    
    
    // MARK: 系统名
    var systemName: String {
        return UIDevice.current.systemName
    }
    
    
}

