//
//  SMCListsCell.swift
//  FullNetProficient
//
//  Created by admin on 2018/7/11.
//  Copyright © 2018年 admin. All rights reserved.
//

import UIKit

class SMCListsCell: UITableViewCell {

    static let identifier = "SMCListsCell"
    
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var contentPic: UIImageView!
    
    var clickOpenAction: ((Bool) -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
