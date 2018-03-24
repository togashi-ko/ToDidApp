//
//  TestObject.swift
//  ToDidApp
//
//  Created by 冨樫公一 on 2018/01/22.
//  Copyright © 2018年 冨樫公一. All rights reserved.
//

import ObjectMapper

class TestObject: Mappable{
    var dev: String?
    var staffList: [StaffObject]?

    required init?(map: Map) {}
    
    // Mappable
    func mapping(map: Map) {
        dev <- map["dev"]
        staffList <- map["staffList"]

    }
    
}

