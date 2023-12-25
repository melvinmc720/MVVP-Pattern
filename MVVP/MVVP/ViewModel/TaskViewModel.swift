//
//  TaskViewModel.swift
//  MVVP
//
//  Created by milad marandi on 12/25/23.
//

import Foundation
import UIKit

struct TaskViewModel{
    var task:Task
    
    var TaskName:String{
        return task.TaskName
    }
    
    var TaskPerson:String{
        return task.TaskPerson
    }
    
    var DueDate:String{
        let Formatter = DateFormatter()
        Formatter.dateStyle = .short
        return Formatter.string(from: task.DueDate)
    }
    
    var TaskIscompleted:Bool{
        return task.taskIsDone
    }
    
    internal func TaskStatus() -> String {
        return task.taskIsDone  ? "Done"  : "In process"
    }
    
}
