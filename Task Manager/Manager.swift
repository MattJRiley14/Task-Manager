//
//  Manager.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation


// Created Manager class to be used in go function of the Menu class
class Manager {
    // An array of Task objects that will be used in this class
    var taskArray: [Task] = [
        // Task objects that contain name and priority values
        Task(name: "Go to Wal-Mart", priority: "H for High Priority"),
        Task(name: "Call Papi", priority: "M for Medium Priority"),
        Task(name: "Shave", priority: "L for Low Priority")
    ]
    
    // Function used to print out an array of Tasks in order of priority
    func listInOrderOfPriority(_ arrayName: [Task]) {
        // Prints out Tasks in array that have a priority of H for High Priority
        for task in arrayName {
            if task.priority == "H for High Priority" {
                print("\(task.name) (Priority: \(task.priority))")
            }
        }
        // Prints out Tasks in array that have a priority of M for Medium Priority
        for task in arrayName {
            if task.priority == "M for Medium Priority" {
                print("\(task.name) (Priority: \(task.priority))")
            }
        }
        // Prints out Tasks in array that have a priority of L for Low Priority
        for task in arrayName {
            if task.priority == "L for Low Priority" {
                print("\(task.name) (Priority: \(task.priority))")
            }
        }
    }
    
    // Function used to add a new Task to the taskArray
    func addTask() {
        print("Please enter name of task:")
        // Get user input for the title
        var newTaskName = readLine()
        
        // Validates input isn't an empty string
        while newTaskName == "" {
            print("Invalid entry. Please try again:")
            newTaskName = readLine()
        }
        
        print("Please enter priority level (H, M, or L):")
        // Gets user input for the priority level
        var newTaskPriority: String? = nil
        
        // Repeats through until a valid priority letter is entered
        repeat {
            // Takes user input for priority & allows user to input letter in lowercase as well as uppercase
            let line = readLine()!.uppercased()
            // Verifys user inputs a valid letter and if else statements change it to the letter and description of that priority letter
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
        
        
        // Creates a new Task object with the name & priority entered
        let newTask = Task(name: newTaskName!, priority: newTaskPriority!)
        // Adds it to the taskArray
        taskArray.append(newTask)
    }
    
    // Function used to verify user enters a valid array index number and returns that number
    func indexEntryVerification (_ arrayName: [Task]) -> Int {
        // Sets index to an Int optional
        var index: Int? = nil
        
        // Repeats until optional index is given a value
        repeat {
            // Gets an input from the user which is used to select the index of a task from a list of tasks. Also, force unwraps the entry so it can be type casted into an Int, which will verify an Int has been entered.
            var userInput = Int(readLine()!)
            
            // This while repeat will repeat until an Int is entered
            while userInput == nil {
                print("Invalid entry. Please try again:")
                userInput = Int(readLine()!)
            }
            // Verifys Int entered is within the bound of the array's indexes and gives the variable index that Int value
            if userInput! >= 0 && userInput! < arrayName.count {
                index = userInput!
            } else {
                print("Invalid entry. Please try again:")
            }
        } while index == nil
        return index!
    }
    
    // Function used to remove a task from taskArray
    func removeTask() {
        // Lists out index and name of each task in the taskArray.
        for index in 0..<taskArray.count {
            print("\(index) \(taskArray[index].name) (Priority: \(taskArray[index].priority))")
        }
        print("Please enter the index of the task you would like to remove:")
        
        // Gives enteredIndex the value of the Int returned from the indexEntryVerification function (taskArray array is entered into the function here)
        let enteredIndex = indexEntryVerification(taskArray)
        
        // Removes Task from taskArray at entered index
        taskArray.remove(at: enteredIndex)
    }
    
    // Function used to list out all tasks in taskArray in order of priority
    func listAllTasks () {
        
        // Runs listInOrderOfPriority function using the taskArray array
        listInOrderOfPriority(taskArray)
    }
    
    // Function used to return an array of Tasks that have notcompleted equal to true
    func getUncompletedTasks() -> [Task] {
        // Creates an empty array
        var uncompletedTasks = [Task]()
        
        // Goes through each task in taskArray and appends those that have notcompleted equal to true to the empty array
        for task in taskArray {
            if task.notCompleted {
                uncompletedTasks.append(task)
            }
        }
        return uncompletedTasks
    }
    
    // Function used to print out array uncompletedTasks in order of priority
    func listUncompletedTasks() {
        // Gives uncompletedTasks value of the array returned from function
        let uncompletedTasks = getUncompletedTasks()
        
        // Prints out message if there are currently no uncompleted tasks
        if uncompletedTasks.count == 0 {
            print("There are currently no tasks to be completed")
        }
        // Runs function using uncompletedTasks array
        listInOrderOfPriority(uncompletedTasks)
    }
    
    // Function used to return an array of Tasks that have notcompleted equal to false
    func getCompletedTasks() -> [Task] {
        // Creates an empty array
        var completedTasks = [Task]()
        
        // Goes through each task in taskArray and appends to the empty array those with notcompleted equal to false
        for task in taskArray {
            if task.notCompleted == false {
                completedTasks.append(task)
            }
        }
        return completedTasks
    }
    
    
    // Function used to print out array completedTasks in order of priority
    func listCompletedTasks() {
        // Gives completedTasks value of the array returned from the function
        let completedTasks = getCompletedTasks()
        
        // Prints out message if there are currently no completed tasks
        if completedTasks.count == 0 {
            print("There are currenty no completed tasks")
        }
        // Runs function using the completedTasks array
        listInOrderOfPriority(completedTasks)
    }
    
    // Function used to set notCompleted in a specific task to false
    func markTaskCompleted() {
        // Gives uncompletedTasks the value of the array returned from the function
        let uncompletedTasks = getUncompletedTasks()
        
        // Prints out message if there are currently no uncompleted tasks
        if uncompletedTasks.count == 0 {
            print("There are currently no tasks to be completed")
        } else {
            // If there are tasks to be completed, then it lists them out with an index for user to enter
            for index in 0..<uncompletedTasks.count {
                print("\(index) \(uncompletedTasks[index].name) (Priority: \(uncompletedTasks[index].priority))")
            }
            
            print("Please enter index of the task you would like to mark completed: ")
            // Gives enteredIndex the value of the Int returned from the indexEntryVerification function (uncompletedTasks array is entered into the function here)
            let enteredIndex = indexEntryVerification(uncompletedTasks)
            // Sets Task at entered index in uncompletedTasks array to false for notCompleted
            uncompletedTasks[enteredIndex].notCompleted = false
        }
    }
    
    // Function used to set notCompleted in a specific task to true
    func markTaskNotCompleted() {
        // Gives completedTasks the value of the array returned from the function
        let completedTasks = getCompletedTasks()
        
        // Prints out message if there are currently no completed tasks
        if completedTasks.count == 0 {
            print("There are currently no completed tasks")
        } else {
            // If there are tasks to be marked not completed, then it lists them out with an index for user to enter
            for index in 0..<completedTasks.count {
                print("\(index) \(completedTasks[index].name) (Priority: \(completedTasks[index].priority))")
            }
            
            print("Please enter the index of the task you would like to mark not completed: ")
            
            // Gives enteredIndex the value of the Int returned from the indexEntryVerification function (completedTasks array is entered into the function here)
            let enteredIndex = indexEntryVerification(completedTasks)
            // Sets Task at entered index in completedTasks array to true for notCompleted
            completedTasks[enteredIndex].notCompleted = true
        }
    }
    
    func avengersSecrets() {
        print("""
                Enter the number of the secret/theory you would like to know:
                1. Name of an original Avenger who will die in Avengers 4
                2. What all the heros will be on screen together at in Avengers 4
                3. The title of Avengers 4
                """)
        // Sets input equal to what the user enters
        let input = readLine()!
        if input == "3" {
            print("The title of Avengers 4 is...")
            sleep(2)
            print("AVENGERS...")
            sleep(2)
            print("...")
            sleep(2)
            print(  """

                     AA  N
                    A  A N
                    AAAA N
                    A  A N
                    A  A N

                    """)
            sleep(3)
        } else if input == "1" {
            print("Captain America/Steve Rogers")
            sleep(1)
        } else if input == "2" {
            print("Tony Stark & Pepper Potts Wedding")
            sleep(1)
        }
    }
}
