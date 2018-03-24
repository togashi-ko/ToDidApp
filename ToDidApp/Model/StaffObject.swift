//
//  staffObject.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2018/02/09.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import UIKit
import ObjectMapper

class StaffObject: Mappable{
    
    var name = ""
    var yakusyoku = ""
    
    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        name <- map["name"]
        yakusyoku <- map["yakusyoku"]
    }
    
}
