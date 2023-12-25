
import UIKit

class ViewController: UIViewController , TableView {

    
    
    var TaskManager:ViewModel!
    let table = UITableView(frame: .zero, style: UITableView.Style.plain)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TaskManager =  ViewModel(View: self)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .done, target: self, action:#selector(AddTask))
        table.delegate = self
        table.dataSource = self
        TaskManager.FetchTasks()
        view.addSubview(table)
        table.register(UITableViewCell.self, forCellReuseIdentifier: "Tasks")
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.frame
        table.center = view.center
    }
    
    @objc private func AddTask(){
        TaskManager.AddTask(TaskName: "NEW TASK", TaskPerson: "your name", DueDate: Date())
    }
    
    func UpdatedView() {
        self.table.reloadData()
    }


}


extension ViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        TaskManager.TaskAmount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Tasks", for: indexPath)
        let task = TaskManager.taskViewModel(at: indexPath.row)
        cell.textLabel?.text = "Task:\(task.TaskName)   Person:\(task.TaskPerson)   Due:\(task.DueDate)"
        cell.detailTextLabel?.text = task.TaskStatus()
        return cell
    }
    
    
}
