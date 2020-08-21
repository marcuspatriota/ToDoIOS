//
//  ListTableViewCell.swift
//  ToDoIOS
//
//  Created by Marcus on 10/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit


final class ListTableViewCell: UITableViewCell {


    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var todoLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var created: UILabel!
    
    // mesma coisa que o  didlord
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }

}

extension ListTableViewCell{
    func configure(with model:TodoModel){
        lineView.backgroundColor = model.type.typeColor
        todoLabel.text = model.type.typeDescripton
        todoLabel.textColor = model.type.typeColor
        
        titleLabel.text = model.todoDesciption
        created.text = formatDate(_date: model.date)
        
    }
    
    private func formatDate(_date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return "at \(formatter.string(from: _date))"
    }
}

