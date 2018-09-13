//
//  Task.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

// This is the data model at represents our Tasks that will be stored in our Manager
class Task {
    // This will store the name of the Task
    var name: String

    // Setting this to true below, since whenever we create a new Task we're going to assume it has not been completed yet
    var notCompleted: Bool
    
    // Since completed is given a value below, the only one that needs to be initialized is name
    init(name: String) {
        self.name = name
        self.notCompleted = true
    }
    
}




