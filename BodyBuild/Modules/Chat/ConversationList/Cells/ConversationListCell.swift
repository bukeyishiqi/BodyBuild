//
//  ConversationListCell.swift
//  BodyBuild
//
//  Created by 陈琪 on 2018/11/7.
//  Copyright © 2018年 Carisok. All rights reserved.
//

import UIKit

class ConversationListCell: UITableViewCell {

    @IBOutlet weak var headImgView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var msgStatusIcon: UIImageView!
    @IBOutlet weak var lastMsgLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
