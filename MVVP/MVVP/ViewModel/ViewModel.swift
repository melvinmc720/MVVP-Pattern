//
//  ViewModel.swift
//  MVVP
//
//  Created by milad marandi on 12/25/23.
//

import Foundation

class ViewModel{
    
    private var Tasks = [Task]()
    var View:TableView
    init(View:TableView){
        self.View = View
    }
    internal func FetchTasks(){
        Tasks = [
            Task(TaskName: "MVVM pattern", TaskPerson: "Milad" , DueDate: Date()) ,
            Task(TaskName: "MVC pattern", TaskPerson: "Melvin" , DueDate: Date())
         ]
    }
    
    internal func AddTask(TaskName:String , TaskPerson:String , DueDate:Date){
        let task = Task(TaskName: TaskName, TaskPerson: TaskPerson, DueDate:DueDate)
        Tasks.append(task)
        View.UpdatedView()
    }
    
    internal func RemoveTask(indexpath taskNumber:Int){
        Tasks.remove(at: taskNumber)
        View.UpdatedView()
    }
    
    
    internal func TaskAmount() -> Int{
        return Tasks.count
    }
    
    internal func taskViewModel(at IndexpathRow:Int) -> TaskViewModel{
        return TaskViewModel(task: Tasks[IndexpathRow])
    }
    
    
}
