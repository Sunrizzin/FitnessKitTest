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
    @objc dynamic var appointment: Int = 0
    @objc dynamic var appointment_id: String = ""
    @objc dynamic var availability: Int = 0
    @objc dynamic var color: String = ""
    @objc dynamic var descriptionField : String = ""
    @objc dynamic var endTime : String = ""
    @objc dynamic var id: Int = 0
    @objc dynamic var name : String = ""
    @objc dynamic var pay: Int = 0
    @objc dynamic var place : String = ""
    @objc dynamic var service_id: String = ""
    @objc dynamic var startTime : String = ""
    @objc dynamic var teacher : String = ""
    @objc dynamic var teacher_v2: Teacher?
    @objc dynamic var weekDay : Int = 0
    
    override class func primaryKey() -> String? {
        return "id"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        appointment <- map["appointment"]
        appointment_id <- map["appointment_id"]
        availability <- map["availability"]
        color <- map["color"]
        descriptionField <- map["description"]
        endTime <- map["endTime"]
        name <- map["name"]
        pay <- map["pay"]
        place <- map["place"]
        service_id <- map["service_id"]
        startTime <- map["startTime"]
        teacher <- map["teacher"]
        teacher_v2 <- map["teacher_v2"]
        weekDay <- map["weekDay"]
    }
}

class Teacher: Object, Mappable {
    @objc dynamic var imageUrl: String = ""
    @objc dynamic var name: String = ""
    @objc dynamic var position: String = ""
    @objc dynamic var short_name: String = ""
    
    override class func primaryKey() -> String? {
        return "imageUrl"
    }
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    public func mapping(map: Map) {
        imageUrl <- map["imageUrl"]
        name <- map["name"]
        position <- map["position"]
        short_name <- map["short_name"]
    }
}
