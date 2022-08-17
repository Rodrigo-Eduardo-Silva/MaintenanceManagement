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
            let database = Database.database().reference()
            let orderRegistration = database.child("Orders")
            orderRegistration.observeSingleEvent(of: .value) { dataSnapShot in
                    let orderData = [
                    "date" : "\(date.formatted())",
                    "descriptionError" : "\(descriptionError)",
                    "machineIdentifier" : "\(machineKey)",
                    "user" : "\(user)",
                    "IdUser": "\(IdUser)",
                    "State" : order?.state as Any
                    ]
                orderRegistration.childByAutoId().setValue(orderData)
            }
       }
    }
}
