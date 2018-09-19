//
//  Task.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

// This is the class that represents our Tasks that will be used in our Manager class
class Task {
    // This creates a String variable called name for each Task
    var name: String
    
    // This creates a String variable called priority for each Task
    var priority: String
    
    // This creates a Bool variable called notCompleted for each Task (Setting this to true below, since whenever we create a new Task we're going to assume it has not been completed yet.)
    var notCompleted: Bool
    
    // Since notCompleted is given a value below, the only ones that need to be initialized are name & priority
    init(name: String, priority: String) {
        self.name = name
        self.priority = priority
        self.notCompleted = true
    }
    
}


