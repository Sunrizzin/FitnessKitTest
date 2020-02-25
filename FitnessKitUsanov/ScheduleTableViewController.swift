//
//  ScheduleTableViewController.swift
//  FitnessKitUsanov
//
//  Created by Aleksey Usanov on 25.02.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit
import RealmSwift

class ScheduleTableViewController: UITableViewController {
    var token: NotificationToken?
    let schedule = API.instance.realm.objects(Schedule.self)
    let dayWeek = ["Понедельник", "Вторник", "Среда", "Черверг", "Пятница", "Суббота", "Воскресенье"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        API.instance.getSchedule { (state) in
            if !state {
                self.showError()
            }
        }
        
        self.token = schedule.observe {  (changes: RealmCollectionChange) in
            switch changes {
            case .error(_):
                self.showError()
            case .initial(_):
                print("Первая инициализация")
            case .update(_, _, _, _):
                print("данные изменились = \(self.schedule.count)")
                self.tableView.reloadSections([0], with: .automatic)
            }
        }
    }
    
    @IBAction func handReload(_ sender: UIBarButtonItem) {
        API.instance.getSchedule { (state) in
            if !state {
                self.showError()
            }
        }
    }
    
    private func showError() {
        let errorAlert = UIAlertController(title: "Упс! Не удалось обновить данные", message: "Попробуйте ручное обновление позже", preferredStyle: .alert)
        let ok = UIAlertAction(title: "Хорошо", style: .default)
        errorAlert.addAction(ok)
        errorAlert.view.tintColor = .systemGreen
        self.present(errorAlert, animated: true, completion: nil)
    }
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {        return schedule.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "scheduleCell", for: indexPath) as! ScheduleTableViewCell
        cell.nameLabel.text = schedule[indexPath.row].name
        cell.descriptionLabel.text = schedule[indexPath.row].descriptionField
        cell.timeLabel.text = "\(dayWeek[schedule[indexPath.row].weekDay - 1]) c \(schedule[indexPath.row].startTime) до \(schedule[indexPath.row].endTime). \(schedule[indexPath.row].place)"
        cell.teacherLabel.text = "Тренер: \(schedule[indexPath.row].teacher)"
        
        return cell
    }
}
