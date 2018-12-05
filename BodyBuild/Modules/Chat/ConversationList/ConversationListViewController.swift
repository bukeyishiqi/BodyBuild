//
//  ConversationListViewController.swift
//  BodyBuild
//
//  Created 陈琪 on 2018/11/7.
//  Copyright © 2018年 Carisok. All rights reserved.
//
//  Template generated by Juanpe Catalán @JuanpeCMiOS
//

import UIKit

class ConversationListViewController: UIViewController, ConversationListViewProtocol {

	var presenter: ConversationListPresenterProtocol?

    @IBOutlet weak var tableView: UITableView!
    let tableViewConfig = TableViewConfiguration<SectionModel<RowModel>>()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "会话列表"
        configTableView()
    }
    
    private func configTableView() {
        tableViewConfig.tableView = tableView
        
        tableViewConfig.configCellContent = {[weak self](cell, rowModel) in
            guard let strongSelf = self else { return }
            
            if let contentCell = cell as? ConversationListCell {
                cell?.textLabel?.text = "@ row \(rowModel.rowValue)"
            }
        }
        
        tableViewConfig.configureCell = {(tableViewConfig, tableView, indexPath, rowModel)  in
            let identifier = rowModel.identifier
            let cell = tableView.dequeueReusableCell(withIdentifier: identifier)
            tableViewConfig.configCellContent(cell!, rowModel)
            return cell!
        }
        
        tableViewConfig.setSections(presenter?.tableViewSections() ?? [])
    }

}
