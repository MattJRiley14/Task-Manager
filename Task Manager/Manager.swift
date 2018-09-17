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
        Task(name: "Go to Wal-Mart", priority: "H for High Priority"),
        Task(name: "Shave", priority: "L for Low Priority"),
        Task(name: "Call Papi", priority: "M for Medium Priority")
    ]
    
    func listInOrderOfPriority(_ arrayName: [Task]) {
        for task in arrayName {
            if task.priority == "H for High Priority" {
                print("\(task.name) (Rated: \(task.priority))")
            }
        }
        
        for task in arrayName {
            if task.priority == "M for Medium Priority" {
                print("\(task.name) (Rated: \(task.priority))")
            }
        }
        for task in arrayName {
            if task.priority == "L for Low Priority" {
                print("\(task.name) (Rated: \(task.priority))")
            }
        }
    }
    
    func addTask() {
        print("Please enter name of task:")
        // Get user input for the title
        var newTaskName = readLine()
        
        // Add input validation to insure the newTaskName isn't an empty string
        while newTaskName == "" {
            print("Invalid entry. Please try again:")
            newTaskName = readLine()
        }
        
        print("Please enter priority level (H, M, or L):")
        
        var newTaskPriority: String? = nil
        
        repeat {
            let line = readLine()!.uppercased()
            if line == "H" || line == "M" || line == "L" {
                if line == "H" {
                    newTaskPriority = "H for High Priority"
                } else if line == "M" {
                    newTaskPriority = "M for Medium Priority"
                } else {
                    newTaskPriority = "L for Low Priority"
                }
            } else {
                print("Invalid entry. Please enter a valid priority level: ")
            }
        } while newTaskPriority == nil
        
        
        // Create a new Task object the name & priority entered
        let newTask = Task(name: newTaskName!, priority: newTaskPriority!)
        // Add it to the taskArray
        taskArray.append(newTask)
    }
    
    func removeTask() {
        // List out index and name of each task in the array.
        for index in 0..<taskArray.count {
            print("\(index) \(taskArray[index].name) (Priority: \(taskArray[index].priority))")
        }
        print("Please enter the index of the task you would like to remove:")
        var userInput = Int(readLine()!)
        
        while userInput == nil {
            print("Invalid entry. Please try again:")
            userInput = Int(readLine()!)
        }
        taskArray.remove(at: userInput!)
    }
    
    func listAllTasks () {
        
        if taskArray.count == 0 {
            print("There are currently no tasks")
        }
        
        listInOrderOfPriority(taskArray)
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
        
        listInOrderOfPriority(uncompletedTasks)
    }
    
    func getCompletedTasks() -> [Task] {
        var completedTasks = [Task]()
        
        for task in taskArray {
            if task.notCompleted == false {
                completedTasks.append(task)
            }
        }
        return completedTasks
    }
    
    
    func listCompletedTasks() {
        let completedTasks = getCompletedTasks()
        
        if completedTasks.count == 0 {
            print("There are currenty no completed tasks")
        }
        
        listInOrderOfPriority(completedTasks)
    }
    
    
    func markTaskCompleted() {
        let uncompletedTasks = getUncompletedTasks()
        
        if uncompletedTasks.count == 0 {
            print("There are currently no tasks to be completed")
        } else {
            for index in 0..<uncompletedTasks.count {
                print("\(index) \(uncompletedTasks[index].name) (Priority: \(uncompletedTasks[index].priority)")
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
                print("\(index) \(completedTasks[index].name) (Priority: \(completedTasks[index].priority)")
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
