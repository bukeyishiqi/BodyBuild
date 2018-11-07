//
//  TableViewConfiguration.swift
//  TableViewOptimization
//
//  Created by 陈琪 on 2018/3/29.
//  Copyright © 2018年 carisok. All rights reserved.
//

import Foundation
import UIKit

public class TableViewConfiguration<S: SectionModelType>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    public typealias I = S.Item
    public typealias CellContentConfig = (UITableViewCell?, I) -> Void
    public typealias CellFactory = (TableViewConfiguration, UITableView, IndexPath, I) -> UITableViewCell
    public typealias CellAction = (UITableView, IndexPath, I) -> Void
    
    public var tableView: UITableView! {
        didSet {
            tableView.delegate = self
            tableView.dataSource = self
//        self.tableView.estimatedRowHeight = 40
            self.tableView.rowHeight = UITableView.automaticDimension
        }
    }
    
    /** 缓存是否使用， 默认使用*/
    public var ignoreCache: Bool? {
        didSet {
            tableView.ignoreCache = ignoreCache
        }
    }
    
    private var _sectionModels:[S] = []
    
    // 索引头部数据
    private var _sectionIndexTitles:[String]?
    
    public subscript(section: Int) -> S {
        let sectionModel = self._sectionModels[section]
        return S(original: sectionModel, items: sectionModel.items)
    }
    
    /** 验证tableView是否存在数据*/
    public var isEmpty: Bool {
        return _sectionModels[0].items.count <= 0
    }
    
    public func setSections(_ sections: [S], _ sectionIndexTitles: [String]? = nil) {
        self._sectionModels = sections
        _sectionIndexTitles = sectionIndexTitles
        tableView.reloadData()
    }
    
    public func deleteSections(section: IndexSet) {
        // 数据移除数据
        let rang = Range.init(uncheckedBounds: (lower: section.rangeView.startIndex, upper: section.rangeView.endIndex)) as Range<Int>
        _sectionModels.removeSubrange(rang)
        
        tableView.beginUpdates()
        tableView.deleteSections(section, with: .fade)
        tableView.endUpdates()
    }
    
    public func deleteRows(rows: [IndexPath]) {
        var sectionModels = [S]()
        
        rows.forEach {
            var items = _sectionModels[$0.section].items
            items.remove(at: $0.row)
            
            let sectionModel = self._sectionModels[$0.section]
            
            sectionModels.append(S(original: sectionModel, items: items))
        }
        self._sectionModels = sectionModels

        tableView.beginUpdates()
        tableView.deleteRows(at: rows, with: .fade)
        tableView.endUpdates()
    }
    
    public func reloadRow(indexPath: IndexPath, value: Any) {
        
        var orginalItems = _sectionModels[indexPath.section].items
        // 原行值
        let row = orginalItems[indexPath.row]
        let newRow = RowModel.init(rowValue: value, reuseIdentifier: row.identifier, height: row.height)
        orginalItems[indexPath.row] = newRow as! S.Item
        
        _sectionModels[indexPath.section] = S(original: _sectionModels[indexPath.section], items: orginalItems)
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [indexPath], with: .none)
        tableView.endUpdates()
    }
    
    public func insertRows(rows: [I], inSection section: Int? = 0) {
        let sectionModel = self._sectionModels[section!]
        let newRows = sectionModel.items + rows
        
        self._sectionModels[section!] = S(original: sectionModel, items: newRows)
        
//        tableView.beginUpdates()
//        tableView.reloadSections(IndexSet.init(integer: section!), with: .none)
//        tableView.endUpdates()
        tableView.reloadData()
    }
    
    public func insertSections(sections: [S]) {
        let newSectionModels = _sectionModels + sections
        setSections(newSectionModels)
    }
    
    
    public var configureCell: CellFactory! = nil
    public var configCellContent: CellContentConfig! = nil
    
    public var actionForCell: CellAction! = nil
    
    public var heightForHeaderInSection:((TableViewConfiguration, Int) -> CGFloat?)?
    public var heightForFooterInSection:((TableViewConfiguration, Int) -> CGFloat?)?
    
    public var titleForHeaderInSection:((TableViewConfiguration, Int) -> String?)?
    public var titleForFooterInSection: ((TableViewConfiguration, Int) -> String?)?
    
    public var viewForHeaderInSection:((TableViewConfiguration, Int) -> UIView?)?
    public var viewForFooterInSection:((TableViewConfiguration, Int) -> UIView?)?
    
    
    // UITableViewDataSource
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return _sectionModels.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard _sectionModels.count > section else { return 0 }
        return _sectionModels[section].items.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        return configureCell(self, tableView, indexPath, _sectionModels[indexPath.section].items[indexPath.row])
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // 注：此处缓存高度
        let item = _sectionModels[indexPath.section].items[indexPath.row]
        if item.height != 0 {
            return item.height!
        }
        
        return tableView.heightForCell(
            identifier: item.identifier,
            cacheByKey: item.getCacheKey(indexPath: indexPath),
            configure:{cell in
                configCellContent(cell, item)
        })
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if actionForCell != nil {
            actionForCell(tableView, indexPath, _sectionModels[indexPath.section].items[indexPath.row])
        }
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titleForHeaderInSection?(self, section)
    }

    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        return titleForFooterInSection?(self, section)
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if let height = heightForHeaderInSection?(self, section)  {
            return height
        }
        
        return 0
    }
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if let height = heightForFooterInSection?(self, section)  {
            return height
        }
        return 0
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return viewForFooterInSection?(self, section)
    }
    
    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return viewForHeaderInSection?(self, section)
    }
    
    // MARK: 侧边栏索引
    public func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return _sectionIndexTitles
    }
    
    public func tableView(_ tableView: UITableView, sectionForSectionIndexTitle title: String, at index: Int) -> Int {
        return index
    }
}






