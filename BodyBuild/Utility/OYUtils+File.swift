//
//  OYUtils+File.swift
//  iboss
//
//  Created by 陈琪 on 2018/8/6.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation


extension OYUtils {
    
    static func fileExist(path: String) -> Bool {
        let manager = FileManager.default

        return manager.fileExists(atPath: path)
    }
    
    // MARK: 统计文件夹大小
    static func calculatefolderSize(path: String) -> UInt64 {
        let manager = FileManager.default
        
        var fileSize: UInt64 = 0
        
        guard let contents = try? manager.contentsOfDirectory(atPath: path) else {
            return 0
        }
        
        for name in contents {
            let itemPath = (path as NSString).appendingPathComponent(name)
            
            do {
                let attr = try manager.attributesOfItem(atPath: itemPath)
                
                let type = attr[FileAttributeKey.type] as? FileAttributeType
                
                if type == nil {
                    continue
                }
                
                if type == FileAttributeType.typeDirectory {
                    fileSize += calculatefolderSize(path: itemPath)
                } else {
                    fileSize += attr[FileAttributeKey.size] as! UInt64
                }
            } catch  {
                print("error :\(error)")
            }

        }
        
//        // 验证文件是否存在
//        if manager.fileExists(atPath: path) {
//
//            // 判断是否为文件夹
//            var pointer = ObjCBool.init(false)
//            if manager.fileExists(atPath: path, isDirectory: &pointer) { // 为文件夹则遍历文件夹内子文件
//                manager.subpaths(atPath: path)?.forEach {
//                   fileSize += calculatefolderSize(path: $0)
//                }
//
//            } else { // 计算文件大小
//                do {
//                    let attr = try manager.attributesOfItem(atPath: path)
//                    fileSize += attr[FileAttributeKey.size] as! Int64
//                } catch  {
//                    print("error :\(error)")
//                }
//            }
//        }
        
        return fileSize
    }
    
    // MARK: 清除文件夹
    static func clearfolder(path: String) {
        let manager = FileManager.default
        
        if manager.fileExists(atPath: path) {
            let childFiles = manager.subpaths(atPath: path)
            
            childFiles?.forEach {
                let absultePath = (path as NSString).appendingPathComponent($0)
                
                if absultePath.hasSuffix(".db") || absultePath.hasSuffix(".sqlitedb") || absultePath.hasSuffix(".log") {
                    return
                } else {
                    do {
                        try manager.removeItem(atPath: absultePath)
                    } catch {
                        print("***移除文件失败：\(absultePath)")
                    }
                }
            }
        }
        
    }
}
