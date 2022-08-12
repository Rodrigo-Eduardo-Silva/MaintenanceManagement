import Foundation
import FirebaseDatabase
import Firebase
import FirebaseAuth
class AddNewMachineModel {
    
    func AddMachine(machine:Machine?) {
        if let name = machine?.name, let description = machine?.description, let idMachine = machine?.id {
            let database = Database.database().reference()
            let machineRegistration = database.child("Machines")
            let user = database.child("Users")
            let auth = Auth.auth()
            if let IdUser = auth.currentUser?.uid {
                let userLoged = user.child(IdUser)
                userLoged.observeSingleEvent(of: .value) { dataSnapshot in
                    let data = dataSnapshot.value as? NSDictionary
                    let machine = [
                         "machineName" : "\(name)",
                         "description" : "\(description)",
                         "SerialNumber" : "\(idMachine)",
                         "Registration" : data?["Name"] as? String
                         ]
                     machineRegistration.childByAutoId().setValue(machine)
                }
            }
        }
    }
}

