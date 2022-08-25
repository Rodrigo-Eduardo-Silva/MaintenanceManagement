import Foundation
import FirebaseAuth
import FirebaseDatabase
class SaveOrderModel {
    var order: OrderMaintenance!
    var user: String?
    var idUser: String?

    func saveOrder(order: OrderMaintenance?) {
        if  let user = order?.user,
            let idUser = order?.idUser,
            let date = order?.date,
            let descriptionError = order?.descriptionError,
            let machineIdentifier = order?.machineIdentifier,
            let machineName = order?.machineName {
            let database = Database.database().reference()
            let orderRegistration = database.child("Orders")
            orderRegistration.observeSingleEvent(of: .value) { _ in
                    let orderData = [
                    "date": "\(date.formatted())",
                    "descriptionError": "\(descriptionError)",
                    "machineIdentifier": "\(machineIdentifier)",
                    "machineName": "\(machineName)",
                    "user": "\(user)",
                    "IdUser": "\(idUser)",
                    "State": order?.state as Any
                    ]
                orderRegistration.childByAutoId().setValue(orderData)
            }
       }
    }
    func authUser() {
        let auth = Auth.auth()
        if let idUserLoged = auth.currentUser?.uid {
            let databese = Database.database().reference()
            let user = databese.child("Users").child(idUserLoged)
            user.observeSingleEvent(of: .value) { dataSnapShot in
                let data = dataSnapShot.value as? NSDictionary
                self.user = data?["Name"] as? String ?? "teste"
                self.idUser = dataSnapShot.key
            }
        }
    }
}
