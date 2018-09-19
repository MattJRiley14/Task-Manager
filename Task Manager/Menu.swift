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

// Creates menu class
class Menu {
    // Sets variable to false so that it will need to be changed to true in the quit function below
    var shouldQuit = false
    
    // Imports everything from the the Manager class
    let manager = Manager()
    
    // Creates go function
    func go() {
        // Runs showMenu function
        showMenu()
        
        // Repeats while shouldQuit = false
        repeat {
            // Sets index equal to Int value retured from getInput function
            let index = getInput()
            // Runs handleInput function with the constant index being the input Int value
            handleInput(index)
        } while !shouldQuit
    }
    
    // Creates showMenu function
    func showMenu() {
        // Prints out the menu
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
    
    // Creates handleInput function with a parameter of input, which is an Int
    func handleInput(_ input: Int) {
        // Creates a switch statement, which is like a big if statement
        switch input {
        case 1: // If input is 1, then addTask & showMenu functions are run.
            manager.addTask()
            showMenu()
        case 2: // If input is 2, then removeTask & showMenu functions are run.
            manager.removeTask()
            showMenu()
        case 3: // Etc...
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
        case 8: // If input is 8, then showMenu function is run.
            showMenu()
        case 9: // If input is 9, then quit function is run.
            quit()
        default: // If input is anything else it will leave the switch statement
            break
        }
    }
    
    // Creates quit function
    func quit() {
        // Prints out question to the user
        print("Are you sure you would like to quit? Y or N?")
        // Sets input equal to what the user enters
        let input = readLine()!
        // Allows user to not have to enter a capital "Y". So it can be "Y" or "y".
        if input.lowercased() == "y" {
            // Changes shouldQuit from false to true (Which will end the program.)
            shouldQuit = true
            // Prints out the message below
            print("Thanks for using the task manager")
        } else { // If user inputs anything other than "Y" or "y", then it will run showMenu
            showMenu()
        }
    }
    
    // Creates getInput function that returns an Int value
    func getInput() -> Int {
        // Creates the variable input which is an Int optional
        var input: Int? = nil
        
        // Repeats while the user enters something other than 1, 2, 3..., or 9
        repeat {
            // Creates variable userInput which is equal to what the user enters, which is force unwrapped and type casted into an Int. (This helps verify that an Int is entered, becuase userInput will have a nil value if an Int is not entered.)
            var userInput = Int(readLine()!)
            
            // Repeats until user enters an Int
            while userInput == nil {
                print("Invalid Input")
                userInput = Int(readLine()!)
            }
            // Verifys Int entered in between 0 & 10. If it is it assigns the userInput value to input. If not it goes back through the repeat while.
            if userInput! > 0 && userInput! < 10 {
                input = userInput!
            } else {
                print("Invalid Input")
            }
        } while input == nil
        // Return input value which is an Int between 0 & 10
        return input!
    }
}
