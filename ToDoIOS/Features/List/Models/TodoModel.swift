//
//  ListTableViewCellController.swift
//  ToDoIOS
//
//  Created by Marcus on 11/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import UIKit

struct TodoModel {
    
    let type: ModelType
    let todoDesciption: String
    let date: Date
    
    enum ModelType {
        case onPriority, daily, home
        
        var typeDescripton: String {
            switch self {
            case .onPriority:
                return "ON PRIORITY"
            case .daily:
                return "DAILY"
            case .home:
                return "HOME"
            }
        }
        
        var typeColor: UIColor {
                  switch self {
                  case .onPriority:
                      return UIColor(named: "priority_color")!
                  case .daily:
                      return UIColor(named: "daily_color")!
                  case .home:
                      return UIColor(named: "home_color")!
                  }
              }
        
        static var allTypes: [ModelType]{
            [.onPriority, .daily, .home ]
        }
        
    }
    
}
