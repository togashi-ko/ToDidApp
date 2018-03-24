//
//  StaffCell.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2018/02/09.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import UIKit

class StaffCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yakusyokuLabel: UILabel!
    

    func configure(object: StaffObject){
        self.nameLabel.text = object.name
        self.yakusyokuLabel.text = object.yakusyoku
    }

}
