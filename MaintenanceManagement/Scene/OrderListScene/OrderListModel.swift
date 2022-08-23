import Foundation
import FirebaseDatabase
protocol OrderLisrModelDelegate: AnyObject {
    func UpdateOrders()
}
class OrderListModel {
    var orders: [OrderMaintenance]  = []
    weak var delegate: OrderLisrModelDelegate?
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
                self.delegate?.UpdateOrders()
         }
    }
}
