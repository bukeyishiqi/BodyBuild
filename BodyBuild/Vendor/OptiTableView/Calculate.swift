//
//  Calculate.swift
//  TableViewOptimization
//
//  Created by 陈琪 on 2018/4/8.
//  Copyright © 2018年 carisok. All rights reserved.
//

import UIKit


extension UITableView {
    
    private func heightForCell(identifier: String,configure: (UITableViewCell) -> Void) -> CGFloat {
        
        let configureCell = templateCellForReuseIdentifier(identifier: identifier)
        //手动调用已确保和屏幕上显示的保持一致
        configureCell.prepareForReuse()
        configure(configureCell)
        
        return systemFittingHeightForConfiguratedCell(configureCell: configureCell)
    }
    
    func heightForCell(identifier: String, cacheByKey key: String, configure: (UITableViewCell) -> Void) -> CGFloat {
        if self.ignoreCache == true {
            return heightForCell(identifier: identifier, configure: configure)
        } else {
            // 验证是否存在缓存 ，存在直接返回，不存在则计算并缓存
            if (self.keyedHeigthCache?.exsitHeight(forKey: key))! {
                return CGFloat((self.keyedHeigthCache?.height(forKey: key).floatValue)!)
            } else {
                let height = heightForCell(identifier: identifier, configure: configure)
                // 缓存
                self.keyedHeigthCache?.cacheHeight(height:NSNumber.init(value: Float(height)), forKey: key)
                return height
            }
        }
    }
    
    func heightForCell(identifier: String, cacheByIndexPath indexPath: IndexPath, configure: (UITableViewCell) -> Void) -> CGFloat {
        if self.ignoreCache == true {
            return heightForCell(identifier: identifier, configure: configure)
        } else {
            // 验证是否存在缓存 ，存在直接返回，不存在则计算并缓存
            if (self.keyedHeigthCache?.exsitHeight(forIndexPath: indexPath))! {
                return CGFloat((self.keyedHeigthCache?.height(forIndexPath: indexPath).floatValue)!)
            } else {
                let height = heightForCell(identifier: identifier, configure: configure)
                // 缓存
                self.keyedHeigthCache?.cacheHeight(height:NSNumber.init(value: Float(height)), forIndexPath: indexPath)
                return height
            }
        }
    }
    
    /** 根据identifier获取Cell*/
    private func templateCellForReuseIdentifier(identifier: String) -> UITableViewCell {
        assert(identifier.count>0, "需要一个正确的identifier - \(identifier)")
        
        if tmpCellForReuseIds == nil {
            tmpCellForReuseIds = [:]
        }
        var tmpCell = tmpCellForReuseIds![identifier]
        if tmpCell == nil { // 不存在则获取一个并缓存
            tmpCell = self.dequeueReusableCell(withIdentifier: identifier)
            if tmpCell == nil { // 注：防止外部没有注册Cell导致闪退问题
                self.register(NSClassFromString(identifier), forCellReuseIdentifier: identifier)
                tmpCell = self.dequeueReusableCell(withIdentifier: identifier)
            }
            tmpCellForReuseIds![identifier] = tmpCell
        }
        return tmpCell!
    }
    
    /** 计算Cell高度及宽度*/
    private func systemFittingHeightForConfiguratedCell(configureCell: UITableViewCell) -> CGFloat {
        var contentViewWidth = self.frame.width
        
        // 获取contentView具体宽度
        var rightSystemViewsWidth: CGFloat = 0.0
        for subView in self.subviews { // 找寻tableView索引控件
            if subView.isKind(of: NSClassFromString("UITableViewIndex")!) {
                rightSystemViewsWidth = subView.frame.width
                break
            }
        }
        
        // Cell内部右边子控件宽度计算
        if configureCell.accessoryView != nil {
            rightSystemViewsWidth += 16 + (configureCell.accessoryView?.frame.width)!
        } else {
            struct systemAccessoryWidths {
                subscript(type: UITableViewCell.AccessoryType) ->CGFloat {
                    switch type {
                        case .none: return 0
                        case .disclosureIndicator: return 34
                        case .detailDisclosureButton: return 68
                        case .checkmark: return 40
                        case .detailButton: return 48
                    }
                }
            }
            
            rightSystemViewsWidth += systemAccessoryWidths()[configureCell.accessoryType]
        }
        
        if UIScreen.main.scale >= 3 && UIScreen.main.bounds.size.width >= 414 {
            rightSystemViewsWidth += 4
        }
        
        contentViewWidth -= rightSystemViewsWidth
        
        var fittingHeight: CGFloat = 0.0
        
        //手动添加一个约束 确保动态内容 如label
        let tempWidthConstraint = NSLayoutConstraint(item: configureCell.contentView,
                                                     attribute: NSLayoutConstraint.Attribute.width,
                                                     relatedBy: NSLayoutConstraint.Relation.equal,
                                                     toItem: nil,
                                                     attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                     multiplier: 1.0,
                                                     constant: contentViewWidth)
        
        configureCell.contentView.addConstraint(tempWidthConstraint)
        // 算出size
        fittingHeight = configureCell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
        // 移除约束
        configureCell.contentView.removeConstraint(tempWidthConstraint)
        if fittingHeight == 0.0 {
            fittingHeight = configureCell.sizeThatFits(CGSize.init(width: contentViewWidth, height: 0)).height
        }
        
        if (fittingHeight == 0.0) {
            fittingHeight = 44; // 默认值
        }
        
        // 添加分割线高度
        if self.separatorStyle != .none {
            fittingHeight += 1.0 / UIScreen.main.scale
        }
        
        return fittingHeight
    }
    
}

/**
 扩展TableView属性
 */
extension UITableView {
    
    private struct AssociatedKeys{
        static var cache = "ass_cache"
        static var cellReuseIds = "ass_cellReuseIds"
        static var ignoreCache = "ass_ignoreCache"
    }
    
    var ignoreCache: Bool? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.ignoreCache, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
        }
        get {
            var ignore = objc_getAssociatedObject(self, &AssociatedKeys.ignoreCache) as? Bool
            if ignore == nil {
                ignore = false // 默认不忽略缓存
                objc_setAssociatedObject(self, &AssociatedKeys.cache, ignore, objc_AssociationPolicy.OBJC_ASSOCIATION_ASSIGN)
            }
            return ignore
        }
    }
    
    // 高度缓存
    var keyedHeigthCache: IndexPathHeightCache? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cache, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            var cache = objc_getAssociatedObject(self, &AssociatedKeys.cache) as? IndexPathHeightCache
            if cache == nil {
                cache = IndexPathHeightCache.init()
                objc_setAssociatedObject(self, &AssociatedKeys.cache, cache, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
            return cache
        }
    }
    
    // 布局Cell缓存
    private var tmpCellForReuseIds: [String: UITableViewCell]? {
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.cellReuseIds, newValue, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.cellReuseIds) as? [String: UITableViewCell]
        }
    }
}




