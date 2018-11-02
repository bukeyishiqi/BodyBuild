//
//  ServerConfig.swift
//  MallMobile
//
//  Created by 陈琪 on 16/10/12.
//  Copyright © 2016年 Carisok. All rights reserved.
//

import Foundation


/**
 *  服务器类型
 */
public enum Server: String {
    case `default` = "Carisok"
}

/** 
 * 服务器环境配置信息
 */

enum Environment: Int {
    /** 正式环境*/
    case formal
    /** 公测环境*/
    case beta
    /** 测试环境*/
    case test
}

/** 环境配置协议*/
protocol EnvironmentType {
    
    var apiBaseUrl: String {get}
    
    var webBaseUrl: String {get}
    
    var uploadBaseUrl: String {get}
    
    var merchantEntryUrl: String {get}
}

/** IM环境配置协议*/
protocol IMEnvironmentType {
    var host: String { get }
    var appKey: String { get }
    var appSecret: String { get }
    var uploadFileUrl: String { get }
}

/*************** 当前项目环境(手动配置) *****************/
let appNetworkEnvironmentType: Environment = .formal

class Enviroment {
    
    /** 根据服务器获取环境配置值*/
    class func value(server: Server) -> EnvironmentType {
        switch server {
        case .default:
            return FCServer .environmentValue()
        }
    }
    
    /** 获取IM连接配置值*/
    class func imValue(server: Server) -> IMEnvironmentType {
        switch server {
        case .default:
            return FCServer.imEnvironmentValue()
        }
    }
}


/**
 *  枫车服务器环境配置
 */
private struct FCServer {
    /** 根据环境获取配置值*/
    static func environmentValue() -> EnvironmentType {
        switch appNetworkEnvironmentType {
        case .formal:
            return Formal()
        case .beta:
            return Beta()
        case .test:
            return Test()
        }
    }

    /** IM环境配置值*/
    static func imEnvironmentValue() -> IMEnvironmentType {
        switch appNetworkEnvironmentType {
        case .formal:
            return imFormal()
        case .beta:
            return imBeta()
        case .test:
            return imTest()
        }
    }
    
    private struct Formal: EnvironmentType {
        var apiBaseUrl: String = "https://mall-api.carisok.com/sellerapp.php"
        var webBaseUrl: String = "https://imall.carisok.com"
        var uploadBaseUrl: String = "https://upload.carisok.com/upload.php"
        var merchantEntryUrl: String = "http://h5.carisok.com/merchant/#/" // 商家入驻
    }
    
    private struct Beta: EnvironmentType {
        var apiBaseUrl: String = "https://test.carisok.com/mall/sellerapp.php"
        var webBaseUrl: String = "https://test.carisok.com/imall/v1_53"
        var uploadBaseUrl: String = "https://test-upload.carisok.com/upload.php"
        var merchantEntryUrl: String = "http://test-h5.carisok.com/merchant/#/" // 商家入驻
    }
    
    private struct Test: EnvironmentType {
        var apiBaseUrl: String = "http://192.168.1.207/imall_dev1/sellerapp.php"
        var webBaseUrl: String = "http://192.168.1.206/imall"
        var uploadBaseUrl: String = "http://192.168.1.206/upload/upload.php"
        var merchantEntryUrl: String = "" // 商家入驻
    }

    
    /*********IM配置值*********/
    private struct imFormal: IMEnvironmentType {
        var uploadFileUrl: String = "https://upload-im.carisok.com/im-file/image/upload"
        
        var host: String = "im.carisok.com"
        var appKey: String = "de25d601456b48ee871fed94d1e49b55"
        
        var appSecret: String = "3ec98a0ea03ffb834859f85946e5ab69"
        
       
    }
    
    private struct imBeta: IMEnvironmentType {
        var uploadFileUrl: String = "https://test.carisok.com/im-file_beta01/image/upload"
        
        var host: String = "im.carisok.com"
        var appKey: String = "d4fe3ed0d11f4a84999f900964f0422c"
        
        var appSecret: String = "3ec98a0ea03ffb834859f85946e5ab69"
    }
    
    private struct imTest: IMEnvironmentType {
        var uploadFileUrl: String = "http://192.168.1.207/im-file_dev1/image/upload"
        
        var host: String = "14.18.155.83"
        var appKey: String = "d4fe3ed0d11f4a84999f900964f0422c"
        
        var appSecret: String = "3ec98a0ea03ffb834859f85946e5ab69"
    }
}





