//
//  OYUtils+HUD.swift
//  iboss
//
//  Created by 陈琪 on 2018/6/29.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import Foundation
import Toast_Swift


let size = CGSize.init(width: 80, height: 80)

let hudImgs = [UIImage.init(named: "loading_02_00000")!.imageWithImageSimple(size),
               UIImage.init(named: "loading_02_00000")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00001")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00002")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00003")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00004")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00005")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00006")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00007")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00008")!.imageWithImageSimple(size),
                UIImage.init(named: "loading_02_00009")!.imageWithImageSimple(size)]

extension OYUtils {
    static /** 显示加载进度提示框*/
        func showHUD(view: UIView, msg: String?, isLock: Bool) -> MBProgressHUD {
        
        let progressHUD = MBProgressHUD.showAdded(to: view, animated: true)  
        progressHUD.bezelView.style = .solidColor // 去掉磨砂效果
        progressHUD.bezelView.backgroundColor = UIColor.clear
        let customView = UIImageView() //.init(frame: CGRect.init(x: 0, y: 0, width: 80, height: 80))
        
//        customView.animationImages = hudImgs
        customView.animationDuration = 1.0
        customView.backgroundColor = UIColor.clear
        customView.animationRepeatCount = 0
        customView.startAnimating()
        progressHUD.customView = customView
        progressHUD.mode = .customView
        progressHUD.backgroundColor = UIColor.clear
        view.addSubview(progressHUD)
        
        progressHUD.removeFromSuperViewOnHide = true
        progressHUD.label.text = msg
        progressHUD.label.textColor = UIColor.black //GlobalConstants.share.theme.FCColor07()
        progressHUD.label.font = UIFont.systemFont(ofSize: 16)//GlobalConstants.share.theme.FCFont02()
        progressHUD.show(animated: true)
        
        return progressHUD
    }
    
    static  /** 显示Toast */
        func showToast(view : UIView?, message : String) {
            if message.isEmpty {
                return
            }
            view?.makeToast(message)
        }
    
    static  /** 显示Toast */
        func showToast(viewController : UIViewController?, message : String) {
            if message.isEmpty {
                return
            }
            viewController?.view.makeToast(message)
        }
    
    static /** 显示Toast */
        func showWindowsToast(message : String) {
            if message.isEmpty {
                return
            }
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.window?.makeToast(message)
        }
}

