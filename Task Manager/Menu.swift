//
//  Menu.swift
//  Task Manager
//
//  Created by Matthew Riley on 9/12/18.
//  Copyright © 2018 Matthew Riley. All rights reserved.
//

import Foundation

// Task Manager
// 1 Add a new task
// 2 Remove a task
// 3 List out all tasks
// 4 List out uncompleted tasks
// 5 List out completed tasks
// 6 Mark a task completed
// 7 Mark a task not completed
// 8 Show Menu
// 9 Quit

class Menu {
    var shouldQuit = false
    
    let manager = Manager()
    
    func go() {
        showMenu()
        
        repeat {
            let index = getInput()
            handleInput(index)
        } while !shouldQuit
    }
    
    func showMenu() {
        print("""

        Menu
        1 Add a new task
        2 Remove a task
        3 List out all tasks
        4 List out uncompleted tasks
        5 List out completed tasks
        6 Mark a task completed
        7 Mark a task not completed
        8 Show Menu
        9 Quit

        """)
    }
    
    // Switch is like a big if statement
    func handleInput(_ input: Int) {
        switch input {
        case 1:
            manager.addTask()
            showMenu()
        case 2:
            manager.removeTask()
            showMenu()
        case 3:
            manager.listAllTasks()
            showMenu()
        case 4:
            manager.listUncompletedTasks()
            showMenu()
        case 5:
            manager.listCompletedTasks()
            showMenu()
        case 6:
            manager.markTaskCompleted()
            showMenu()
        case 7:
            manager.markTaskNotCompleted()
            showMenu()
        case 8:
            showMenu()
        case 9:
            quit()
        default: // If input is anything else
            break
        }
    }
    
    
    func quit() {
        print("Are you sure you would like to quit? Y or N?")
        let input = readLine()!
        if input.lowercased() == "y" {
            shouldQuit = true
            print("Thanks for using the video game library")
        }
    }
    
    func getInput() -> Int {
        var input: Int? = nil
        
        repeat {
            var userInput = Int(readLine()!)
            
            while userInput == nil {
                print("Invalid Input")
                userInput = Int(readLine()!)
            }
            
            if userInput! >= 1 && userInput! <= 9 {
                input = userInput!
            } else {
                print("Invalid Input")
            }
        } while input == nil
        return input!
    }
}
































