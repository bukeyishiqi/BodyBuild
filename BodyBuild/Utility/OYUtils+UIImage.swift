//
//  OYUtils+UIImage.swift
//  iboss
//
//  Created by 陈琪 on 2018/7/9.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import UIKit


extension UIImage {
    static func createImage(color: UIColor) -> UIImage? {

        let rect = CGRect.init(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(color.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
        
    }
    
    // 压缩图片
    func imageWithImageSimple(_ newSize : CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    

    // 保存图片到沙盒
    static func saveImage(_ tempImage : UIImage, _ imageName : String) {
        let imageData = tempImage.pngData()
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0] as NSString
        let fullPathToFile = documentsDirectory.appendingPathComponent(imageName)
        let fileURL = URL(fileURLWithPath: fullPathToFile)
        try? imageData?.write(to: fileURL)
    }
}


// MARK: 图片压缩
extension OYUtils {

    /**
     *  压缩上传图片到指定字节
     *
     *  image     压缩的图片
     *  maxLength 压缩后最大大小(kb)
     *
     *  return 压缩后图片的二进制
     */
   static func compressImage(image: UIImage, maxLength: Int) -> Data? {
        
        let newSize = self.scaleImage(image: image, imageLength: 300)
        let newImage = self.resizeImage(image: image, newSize: newSize)
        
        var compress:CGFloat = 0.9
        var data = newImage.jpegData(compressionQuality: compress) //UIImageJPEGRepresentation(newImage, compress)
        
        while (data?.count)! > maxLength*1024 && compress > 0.01 {
            compress -= 0.02
            data = newImage.jpegData(compressionQuality: compress)
        }
        
        return data
    }
    
    /**
     *  通过指定图片最长边，获得等比例的图片size
     *
     *  image       原始图片
     *  imageLength 图片允许的最长宽度（高度）
     *
     *  return 获得等比例的size
     */
    static func  scaleImage(image: UIImage, imageLength: CGFloat) -> CGSize {
        
        var newWidth:CGFloat = 0.0
        var newHeight:CGFloat = 0.0
        let width = image.size.width
        let height = image.size.height
        
        if (width > imageLength || height > imageLength){
            
            if (width > height) {
                
                newWidth = imageLength;
                newHeight = newWidth * height / width;
                
            }else if(height > width){
                
                newHeight = imageLength;
                newWidth = newHeight * width / height;
                
            }else{
                
                newWidth = imageLength;
                newHeight = imageLength;
            }
            
        }
        return CGSize(width: newWidth, height: newHeight)
    }
    
    /**
     *  获得指定size的图片
     *
     *  image   原始图片
     *  newSize 指定的size
     *
     *  return 调整后的图片
     */
   static func resizeImage(image: UIImage, newSize: CGSize) -> UIImage {
        UIGraphicsBeginImageContext(newSize)
        image.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}









