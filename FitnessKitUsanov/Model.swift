//
//  Model.swift
//  FitnessKitUsanov
//
//  Created by Aleksey Usanov on 25.02.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation
import ObjectMapper
import RealmSwift

class Schedule: Object, Mappable {
    
    @objc dynamic var id: Int = 0
    @objc dynamic var descriptionField : String = ""
    @objc dynamic var endTime : String = ""
    @objc dynamic var name : String = ""
    @objc dynamic var place : String = ""
    @objc dynamic var startTime : String = ""
    @objc dynamic var teacher : String = ""
    @objc dynamic var weekDay : Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        descriptionField <- map["description"]
        endTime <- map["endTime"]
        name <- map["name"]
        place <- map["place"]
        startTime <- map["startTime"]
        teacher <- map["teacher"]
        weekDay <- map["weekDay"]
    }
}
