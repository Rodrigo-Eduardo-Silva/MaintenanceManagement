import Foundation
import FirebaseAuth
import FirebaseDatabase

class CloseOrderModel {
    var ordeListModel = OrderListModel()
    
    func saveOrder(orderIdentifier: String) {
        let database = Database.database().reference()
        let orderRegistration = database.child("Orders").child(orderIdentifier)
        
        orderRegistration.observeSingleEvent(of: .value) { dataSnapShot in
            let status = ["State" : "closed"]
            dataSnapShot.ref.updateChildValues(status)
        }
    }
}
