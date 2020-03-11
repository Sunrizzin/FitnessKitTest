//
//  ScheduleTableViewCell.swift
//  FitnessKitUsanov
//
//  Created by Aleksey Usanov on 25.02.2020.
//  Copyright © 2020 Aleksey Usanov. All rights reserved.
//

import UIKit

class ScheduleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var rootView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var teacherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        rootView.layer.shadowColor = UIColor.black.cgColor
        rootView.layer.shadowOffset = .zero
        rootView.layer.shadowPath = UIBezierPath(rect: rootView.bounds).cgPath
        rootView.layer.shadowRadius = 10
        rootView.layer.shadowOpacity = 0.8
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
