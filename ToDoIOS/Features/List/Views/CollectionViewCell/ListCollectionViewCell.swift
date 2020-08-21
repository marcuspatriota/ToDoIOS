//
//  ListCollectionViewCell.swift
//  ToDoIOS
//
//  Created by Marcus on 20/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class ListCollectionViewCell: UICollectionViewCell {
       
    @IBOutlet weak var priority: UILabel!

    @IBOutlet weak var activite1: UILabel!
    @IBOutlet weak var activite2: UILabel!
    @IBOutlet weak var activite3: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = (frame.size.height - 128)/2
        
	}

}
//MARK: Extension Configuração de Metodos
extension ListCollectionViewCell{
    func configureCell(_ type: TodoModel.ModelType) {
        configureColor(type)
        priority.text = type.typeDescripton
        activite1.text = ""
        activite2.text = ""
        activite3.text = ""
        
        var num = 1
        var aux: [String] = []
        for item in TodoDateSource.shared.todos {
            if(item.type == type && num <= 3 ){
                if num == 1 {
                    activite1.text = item.todoDesciption
                }else if num == 2{
                    activite2.text = item.todoDesciption
                }else if num == 3{
                    activite3.text = item.todoDesciption
                }
                num = num+1
                aux.append(item.todoDesciption)
            }
        }
    }
    
    private func configureColor(_ type: TodoModel.ModelType){
        let colorView = UIView(frame: bounds)
        colorView.backgroundColor = type.typeColor
        self.backgroundView = colorView

    }
}
