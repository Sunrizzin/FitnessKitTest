//
//  API.swift
//  FitnessKitUsanov
//
//  Created by Aleksey Usanov on 24.02.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation
import RealmSwift
import Alamofire
import AlamofireObjectMapper

class API {
    static let instance = API()
    private let url = "https://sample.fitnesskit-admin.ru/schedule/get_group_lessons_v2/1/"
    private init() {}
    
    let realm = try! Realm()
    
    func getSchedule(_ completion: @escaping (Bool) -> Void) {
        guard let url = URL(string: self.url) else { return }
        
        AF.request(url).responseArray { (response:AFDataResponse<[Schedule]>) in
            if let items = response.value {
                do {
                    try self.realm.write {
                        for i in 0..<items.count {
                            items[i].id = i
                            self.realm.add(items[i], update: .all)
                        }
                    }
                    completion(true)
                } catch _ {
                    completion(false)
                }
            } else {
                completion(false)
            }
        }
    }
}
