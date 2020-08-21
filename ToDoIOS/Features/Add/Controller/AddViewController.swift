//
//  AddViewController.swift
//  ToDoIOS
//
//  Created by Marcus on 13/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var buttonBack: CircleButton!
    @IBOutlet weak var saveButton: CircleButton!
    
    @IBOutlet weak var sideView: UIView!
    @IBOutlet weak var ToDo: UITextField!
    
    @IBOutlet weak var priorityPick: UIPickerView!
    @IBOutlet weak var datePick: UIDatePicker!
    
    private var selectPriority: TodoModel.ModelType = .onPriority{
        didSet{
            configureColor()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureColor(animated: false)
        configureButtons()
        configureTypePick()
    }
    
}

//MARK: Configure methods extencion
extension AddViewController{
    
    private func configureTextFiel(){
        ToDo.borderStyle = .none // tirar as bordas do texto
    }
    private func configureButtons(){
        buttonBack.addTarget(self, action: #selector(backButton), for: .primaryActionTriggered)
        saveButton.addTarget(self, action: #selector(saveButtonPreserve), for: .primaryActionTriggered)
        
    }
    
    private func configureTypePick(){
        priorityPick.dataSource = self
        priorityPick.delegate = self
    }
    
    private func configureColor(animated: Bool = true){
        if(animated){
            UIView.animate(withDuration: 0.3){
                self.buttonBack.backgroundColor = self.selectPriority.typeColor
                self.sideView.backgroundColor = self.selectPriority.typeColor
                self.saveButton.backgroundColor = self.selectPriority.typeColor
            }
        }else{
            buttonBack.backgroundColor = selectPriority.typeColor
            sideView.backgroundColor = selectPriority.typeColor
            saveButton.backgroundColor = selectPriority.typeColor
        }
    }

}

//MARK: Action methods extencion
extension AddViewController{
    @objc
    private func backButton(){
        navigationController?.popViewController(animated: true)
    }
    @objc
    private func saveButtonPreserve(){
        guard let text = ToDo.text else {
            return
        }
        let model = TodoModel(type: selectPriority, todoDesciption: text, date: datePick.date)
        TodoDateSource.shared.todos.append(model)
        navigationController?.popViewController(animated: true)
    }
}

//MARK: UIPickerView delegate and datasource methods extencion
extension AddViewController:UIPickerViewDelegate, UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return TodoModel.ModelType.allTypes.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return TodoModel.ModelType.allTypes[row].typeDescripton
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectPriority = TodoModel.ModelType.allTypes[row]
    }
    
}
