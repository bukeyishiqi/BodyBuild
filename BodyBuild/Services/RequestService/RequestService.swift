//
//  RequestService.swift
//  MallMobile
//
//  Created by 陈琪 on 16/10/21.
//  Copyright © 2016年 Carisok. All rights reserved.
//

import Foundation

/**
 *  交付层顶层协议
 */
public protocol RequestServiceType {
    
}


/**
 *  网络数据交付层协议
 */
public protocol NetworkRequestServiceType {}


// MARK: *  网络数据交付层

extension NetworkRequestServiceType {
    /**
     *  普通网络请求
     */
    func sendGetRequest(url: String, _ params: [String: Any]?, _ headers: Headers? = nil, _ cache: Bool = false, complation: Completion?) -> Int {
        if cache == true { /** 获取缓存数据*/
            
            return 0
        }
        
        var requestSet: RequestSet = RequestSet.init(method: .Get, url: url, params, headers)
        requestSet.configuration(resonseBlock: complation)
        
        return HttpClient.shareInstance.sendRequest(reqeustSet: requestSet)
    }
    
    func sendPostRequest(url: String, _ params: [String: Any]?, _ headers: Headers? = nil, _ cache: Bool = false, complation: Completion?) -> Int {

        var requestSet: RequestSet = RequestSet.init(method: .Post, url: url, params, headers)
        requestSet.configuration(resonseBlock: complation)
        
        return HttpClient.shareInstance.sendRequest(reqeustSet: requestSet)
    }
    
    /**
     *  数据上传
     */
    func upload(url: String, name: String?, filePath: String,_ headers: Headers? = nil, uploadProgress: UploadProgress? = nil, complation: Completion?) -> Int {
        var requestSet: RequestSet = RequestSet.init(method: .Post, url: url, nil, headers)
        requestSet.uploadConfig(name, filePath: filePath, progress: uploadProgress, complation)
        
        return HttpClient.shareInstance.sendRequest(reqeustSet: requestSet)
    }
    
    /**
     *  数据下载
     */
    func download(url: String, params: [String: Any]? = nil, savePath: String, _ headers: Headers? = nil, downloadProgress: DownloadProgress? = nil, complation: Completion?) -> Int {
        var requestSet: RequestSet = RequestSet.init(method: .Post, url: url, params, headers)
        requestSet.downloadConfig(savePath: savePath, downloadProgress, complation)
        
        return HttpClient.shareInstance.sendRequest(reqeustSet: requestSet)
    }
    
    /**
     *  暂停下载
     */
    func suspend(key: Int) {
        HttpClient.shareInstance.pasue(requestID: key)
    }
    
    /**
     *  继续下载
     */
    func resume(key: Int) {
        HttpClient.shareInstance.resume(requestID: key)
    }
    
    /**
     *  取消
     */
    func cancel(list: [Int]) {
        HttpClient.shareInstance.cancelRequestList(requestIDs: list)
    }
}


public class RequestService: RequestServiceType {
    
    static let `default`: RequestService = {
        return RequestService()
    }()
}

extension RequestService: NetworkRequestServiceType {

}



