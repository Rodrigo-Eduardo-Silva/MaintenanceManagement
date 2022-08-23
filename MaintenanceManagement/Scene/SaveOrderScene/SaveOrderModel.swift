import Foundation
import FirebaseAuth
import FirebaseDatabase
class SaveOrderModel {
    var order: OrderMaintenance!
    var user: String?
    var IdUser: String?
    
    func SaveOrder(order: OrderMaintenance?) {
        if  let user = order?.user,
            let IdUser = order?.IdUser,
            let date = order?.date,
            let descriptionError = order?.descriptionError,
            let machineIdentifier = order?.machineIdentifier,
            let machineName = order?.machineName
        {
            let database = Database.database().reference()
            let orderRegistration = database.child("Orders")
            orderRegistration.observeSingleEvent(of: .value) { dataSnapShot in
                    let orderData = [
                    "date" : "\(date.formatted())",
                    "descriptionError" : "\(descriptionError)",
                    "machineIdentifier" : "\(machineIdentifier)",
                    "machineName" : "\(machineName)",
                    "user" : "\(user)",
                    "IdUser": "\(IdUser)",
                    "State" : order?.state as Any
                    ]
                orderRegistration.childByAutoId().setValue(orderData)
            }
       }
    }
    func authUser(){
        let auth = Auth.auth()
        if let IdUserLoged = auth.currentUser?.uid{
            let databese = Database.database().reference()
            let user = databese.child("Users").child(IdUserLoged)
            user.observeSingleEvent(of: .value) { dataSnapShot in
                let data = dataSnapShot.value as? NSDictionary
                self.user = data?["Name"] as? String ?? "teste"
                self.IdUser = dataSnapShot.key
            }
        }
    }
}
