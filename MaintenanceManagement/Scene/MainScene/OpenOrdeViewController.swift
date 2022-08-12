import UIKit
import FirebaseDatabase
import FirebaseAuth

class OpenOrdeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var machine: [Machine] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OpenOrderTableViewCell.nib, forCellReuseIdentifier: OpenOrderTableViewCell.cell)
        updateMachine()
    }
    func updateMachine() {
        let database = Database.database().reference()
        let machineData = database.child("Machines")
        machineData.observe(.childAdded) { dataSnapshot in
            let data = dataSnapshot.value as? NSDictionary
            let machine = Machine(name: data?["machineName"] as? String ?? "teste",
                                  id: data?["SerialNumber"] as? String  ?? "teste",
                                  description: data?["description"] as? String ?? "teste",
                                  key: dataSnapshot.key)
            self.machine.append(machine)
            self.tableView.reloadData()
        }
    }
}

extension OpenOrdeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.machine.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OpenOrderTableViewCell.cell, for: indexPath)
        let machine = self.machine[indexPath.row]
        cell.textLabel?.text = machine.name
        cell.detailTextLabel?.text = machine.id
        return cell
    }
}
extension OpenOrdeViewController: UITableViewDelegate {
    
}
