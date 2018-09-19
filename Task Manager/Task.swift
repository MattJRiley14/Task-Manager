//
//  Task.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

// This is the class that represents our Tasks that will be stored in our Manager
class Task {
    // This will store the name of the task
    var name: String
    
    // This will store the priority of the task
    var priority: String
    
    // Setting this to true below, since whenever we create a new Task we're going to assume it has not been completed yet
    var notCompleted: Bool
    
    // Since notCompleted is given a value below, the only ones that need to be initialized are name & priority
    init(name: String, priority: String) {
        self.name = name
        self.priority = priority
        self.notCompleted = true
    }
    
}


