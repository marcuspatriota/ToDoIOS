//
//  TodoDataSource.swift
//  ToDoIOS
//
//  Created by Marcus on 11/08/20.
//  Copyright © 2020 cesar. All rights reserved.
//

import Foundation

final class TodoDateSource {
    
    static let shared = TodoDateSource()
    
    private init(){}
    
    var todos: [TodoModel] = [
        /*
     TodoModel(type: .onPriority, todoDesciption: "ToDo Priority", date: Date()),
          TodoModel(type: .daily, todoDesciption: "ToDo Daily", date: Date()),
          TodoModel(type: .home, todoDesciption: "ToDo Home", date: Date()),
          TodoModel(type: .onPriority, todoDesciption: "ToDo Priority 1", date: Date()),
          TodoModel(type: .daily, todoDesciption: "ToDo Daily 2", date: Date()),
          TodoModel(type: .home, todoDesciption: "ToDo Home 3", date: Date())
       */
      ]
         
    
}
