//
//  SchedulePresenter.swift
//  FitnessKitUsanov
//
//  Created by Aleksey Usanov on 11.03.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import Foundation


import Foundation

protocol ScheduleViewDelegate: NSObjectProtocol {
    func updateUI()
}

class SchedulePresenter {
    
    private let apiService: APIService
    
    weak private var scheduleViewDelegate: ScheduleViewDelegate?
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func setViewDelegate(scheduleViewDelegate: ScheduleViewDelegate?) {
        self.scheduleViewDelegate = scheduleViewDelegate
    }
    
    func refresh() {
        apiService.getSchedule { (state) in
            if state {
                self.scheduleViewDelegate?.updateUI()
            }
        }
    }
}
