//
//  Manager.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

class Manager {
    // An array of Task objects that will be handled by this class
    var taskArray: [Task] = [
        Task(name: "Go to Wal-Mart"),
        Task(name: "Shave"),
        Task(name: "Call Papi")
    ]
    
    func addTask() {
        print("Please enter name of task:")
        // Get user input for the title
        var newTaskName = readLine()
        
        // Add input validation to insure the newTaskName isn't an empty string
        while newTaskName == "" {
            print("Invalid entry. Please try again:")
            newTaskName = readLine()
        }
        
        // Create a new Task object the name entered
        let newTask = Task(name: newTaskName!)
        // Add it to the taskArray
        taskArray.append(newTask)
        
        for task in taskArray {
            print(task.name)
        }
    }
    
    
    func removeTask() {
        // List out index and name of each task in the array.
        for index in 0..<taskArray.count {
            print("\(index) \(taskArray[index].name)")
        }
        print("Please enter the index of the task you would like to remove:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid entry. Please try again:")
            userInput = Int(readLine()!)
        }
        taskArray.remove(at: userInput!)
    }
    
    
    func getUncompletedTasks() -> [Task] {
        var uncompletedTasks = [Task]()
        
        for task in taskArray {
            if task.notCompleted {
                uncompletedTasks.append(task)
            }
        }
        return uncompletedTasks
    }
    
    func listUncompletedTasks() {
        let uncompletedTasks = getUncompletedTasks()
        
        if uncompletedTasks.count == 0 {
            print("There are currently no tasks to be completed")
        }
        
        for task in taskArray {
            if task.notCompleted {
                print(task.name)
            }
        }
    }
    
    func getCompletedTasks() -> [Task] {
        var completedTasks = [Task]()
        
        for task in taskArray {
            if task.notCompleted == false {
                taskArray.append(task)
            }
        }
        return completedTasks
    }
    
    
    func listCompletedTasks() {
        let completedTasks = getCompletedTasks()
        
        if completedTasks == 0 {
            print("There are currenty no completed tasks")
        }
        
        for task in taskArray {
            if !task.notCompleted {
                print(task.name)
            }
        }
    }
    
    
    func markTaskCompleted() {
        let uncompletedTasks = getUncompletedTasks()
        
        if uncompletedTasks.count == 0 {
            print("There are currently no tasks to be completed")
        } else {
            for index in 0..<uncompletedTasks.count {
                print("\(index) \(uncompletedTasks[index].name)")
            }
            
            print("Please enter index of the task you would like to mark completed: ")
            
            var index: Int? = nil
            
            repeat {
                var userInput = Int(readLine()!)
                
                while userInput == nil {
                    print("Invalid input. Please enter a valid index.")
                    userInput = Int(readLine()!)
                }
                
                if userInput! >= 0 && userInput! < uncompletedTasks.count {
                    index = userInput!
                } else {
                    print("Please enter a valid index")
                }
            } while index == nil
            
            uncompletedTasks[index!].notCompleted = false
        }
    }
    
    func markTaskNotCompleted() {
        let completedTasks = getCompletedTasks()
        
        if completedTasks.count == 0 {
            print("There are currently no completed tasks")
        } else {
            for index in 0..<completedTasks.count {
                print("\(index) \(completedTasks[index].name)")
            }
            
            print("Please enter the index of the task you would like to mark not completed: ")
            
            var index: Int? = nil
            
            repeat {
                var userInput = Int(readLine()!)
                
                while userInput == nil {
                    print("Please enter a valid index")
                    userInput = Int(readLine()!)
                }
                
                if userInput! >= 0 && userInput! < completedTasks.count {
                    index = userInput!
                } else {
                    print("Please enter a valid index")
                }
            } while index == nil
            
            completedTasks[index!].notCompleted = true
        }
    }
}

































