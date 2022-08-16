import Foundation
import FirebaseAuth
import FirebaseDatabase
class SaveOrderModel {
    var order: OrderMaintenance!
    
    func SaveOrder(order: OrderMaintenance?) {
        if  let user = order?.user,
            let IdUser = order?.IdUser,
            let date = order?.date,
            let descriptionError = order?.descriptionError,
            let machineKey = order?.machine.identifier
        {
            let datadase = Database.database().reference()
            let machine = datadase.child("Machines")
            let orderRegistration = machine.child(machineKey).child("Orders")
            orderRegistration.observeSingleEvent(of: .value) { dataSnapShot in
                    let orderData = [
                    "date" : "\(date.formatted())",
                    "orderNumber" : "\(dataSnapShot.key)",
                    "descriptionError" : "\(descriptionError)",
                    "user" : "\(user)",
                    "IdUser": "\(IdUser) ",
                    ]
                orderRegistration.childByAutoId().setValue(orderData)
            }
       }
    }
}
