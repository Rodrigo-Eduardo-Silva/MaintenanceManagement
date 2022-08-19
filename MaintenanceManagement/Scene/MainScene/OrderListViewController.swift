import UIKit
import FirebaseDatabase
class OrderListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var orders: [OrderMaintenance] = []
    var machine: Machine?
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
                let order = OrderMaintenance(user: data?["user"] as? String ?? "teste",
                                             IdUser: data?["IdUser"] as? String ?? "teste",
                                             date: data?["date"] as? Date ?? Date.now,
                                             descriptionError: data?["descriptionError"]  as? String ?? "teste",
                                             state: data?["State"] as? Bool ?? true,
                                             machineidentifier: data?["machineIdentifier"] as? String  ?? "teste",
                                             machineName: data?["machineName"]  as? String  ?? "teste")
                
                    self.orders.append(order)
                    self.tableView.reloadData()
         }
    }
//    func loadMachine(machineIdentifier: String?) -> String {
//            let database = Database.database().reference()
//            let machineData = database.child("Machines")
//        if let identifier = machineIdentifier {
//            machineData.child(identifier).observeSingleEvent(of: .value) { (dataSnapShot) in
//                let data = dataSnapShot.value as? NSDictionary
//                if let machineName = data?["machineName"] as? String,
//                   let id = data?["serialNumber"] as? String,
//                   let description = data?["description"] as? String {
//                    self.machine = Machine(name: machineName, id: id, description: description, identifier: identifier)
//                    print(self.machine as Any)
//                }
//            }
//        }
//               return self.machine?.identifier
//    }
}
extension OrderListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderListTableViewCell.cell, for: indexPath)
        let order = self.orders[indexPath.row]
        cell.textLabel?.text = order.machineName
        cell.detailTextLabel?.text = order.descriptionError
        return cell
    }

}
extension OrderListViewController: UITableViewDelegate {
    
}
