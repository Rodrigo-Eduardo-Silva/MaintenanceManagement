import Foundation
import FirebaseDatabase
protocol OrderLisrModelDelegate: AnyObject {
    func updateOrders()
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
                                             idUser: data?["IdUser"] as? String ?? "teste",
                                             date: data?["date"] as? Date ?? Date.now,
                                             descriptionError: data?["descriptionError"]  as? String ?? "teste",
                                             state: data?["State"] as? String ?? "opened",
                                             machineidentifier: data?["machineIdentifier"] as? String  ?? "teste",
                                             machineName: data?["machineName"]  as? String  ?? "teste",
                                             orderIdentifier: dataSnapshot.key)
                if data?["State"] as? String == "opened" {
                    self.orders.append(order)
                    self.delegate?.updateOrders()
                }
         }
        orderData.observe(.childChanged) { dataSnapShot in
            var index = 0
            for order in self.orders {
                if order.orderIdentifier == dataSnapShot.key{
                    self.orders.remove(at: index)
                }
                index += 1
            }
            self.delegate?.updateOrders()
        }
    }
}

