import UIKit
import FirebaseDatabase
class OrderListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var orders: [OrderMaintenance] = []
    var machine: Machine!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderListTableViewCell.nib, forCellReuseIdentifier: OrderListTableViewCell.cell)
        loadOrdes()
    }
    func loadOrdes() {
        let database = Database.database().reference()
        let orderData = database.child("Orders")
             orderData.observe(.childAdded) { dataSnapshot in
            let data = dataSnapshot.value as? NSDictionary
            let order = OrderMaintenance(user: data?["user"] as? String ?? "teste", IdUser: data?["IdUser"] as? String ?? "teste", date: data?["date"] as? Date ?? Date.now, descriptionError: data?["descriptionError"]  as? String ?? "teste", state: data?["State"] as? Bool ?? true, machine: self.loadMachine(machineIndentifier: data?["machineIdentifier"] as? String ??  "teste"))
                 self.orders.append(order)
                 self.tableView.reloadData()
            
        }
    }
        func loadMachine(machineIndentifier: String) -> Machine {
            var machine: Machine?
            let database = Database.database().reference()
            let machineData = database.child("Machines")
                machineData.child(machineIndentifier).observeSingleEvent(of: .value) { dataSnapShot in
                let data = dataSnapShot.value as? NSDictionary
                 machine = Machine(name: data?["machineName"] as? String ?? "teste",
                                      id: data?["SerialNumber"] as? String  ?? "teste",
                                      description: data?["description"] as? String ?? "teste",
                                      identifier: machineIndentifier)
                    return machine
                }
        }
}
extension OrderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.cell, for: indexPath)
        let order = self.orders[indexPath.row]
        cell.textLabel?.text = order.machine.name
        cell.detailTextLabel?.text = order.descriptionError
        return cell
    }
    
    
}
extension OrderListViewController: UITableViewDelegate {
    
}
