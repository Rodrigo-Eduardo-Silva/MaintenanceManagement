import UIKit
import FirebaseDatabase
class OrderListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var model = OrderListModel()
    var closerOrdeModel = CloseOrderModel()
    var orders: [OrderMaintenance] {
        model.orders
    }
    var isMechanical: Bool!
    init(isMechanical: Bool) {
        self.isMechanical = isMechanical
        super.init(nibName: "OrderListViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(OrderListTableViewCell.nib, forCellReuseIdentifier: OrderListTableViewCell.cell)
        model.delegate = self
        model.loadOrdes()
    }
    func showCloseOrder(order: OrderMaintenance) {
        let viewController = CloseOrderViewController(order: order)
        present(viewController, animated: true, completion: nil)
    }
}
   
// MARK: - Table view data source
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
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.isMechanical == true {
            let order = orders[indexPath.row]
            showCloseOrder(order: order)
        }
    }
}
extension OrderListViewController: OrderLisrModelDelegate {
    func updateOrders() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.reloadData()
        }
    }
}
