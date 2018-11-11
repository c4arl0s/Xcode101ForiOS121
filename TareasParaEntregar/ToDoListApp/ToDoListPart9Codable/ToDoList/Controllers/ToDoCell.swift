//
//  ToDoCell.swift
//  ToDoList
//
//  Created by Carlos Santiago Cruz on 12/10/18.
//  Copyright © 2018 Carlos Santiago Cruz. All rights reserved.
//

import Foundation
import UIKit

//  The delegate that adopts the protocol must be a class.
@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UITextField!
    var delegate: ToDoCellDelegate?

    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
        print("button tapped")
    }
}


