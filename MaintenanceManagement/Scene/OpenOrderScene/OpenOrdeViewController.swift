import UIKit
import FirebaseDatabase
import FirebaseAuth

class OpenOrdeViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model = OpenOrderModel()
    var machines: [Machine] {
        model.machines
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OpenOrderTableViewCell.nib, forCellReuseIdentifier: OpenOrderTableViewCell.cell)
        model.delegate = self
        model.updateMachine()
    }
    func showOpenOrder(machine: Machine) {
        let machine = machines[tableView.indexPathForSelectedRow!.row]
        let viewController = SaveOrderViewController(machine: machine)
        navigationController?.present(viewController, animated: true, completion: nil)
    }
}

extension OpenOrdeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.machines.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OpenOrderTableViewCell.cell, for: indexPath)
        let machine = self.machines[indexPath.row]
        cell.textLabel?.text = machine.name
        cell.detailTextLabel?.text = machine.identifier
        return cell
    }
}
extension OpenOrdeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let machine = machines[indexPath.row]
        showOpenOrder(machine: machine)
    }
}
extension OpenOrdeViewController: OpenOrderModelDelegate {
    func updateOpenOrderModel() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }

}
