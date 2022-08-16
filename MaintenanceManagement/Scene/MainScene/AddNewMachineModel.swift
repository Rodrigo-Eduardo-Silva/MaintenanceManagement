import Foundation
import FirebaseDatabase
import Firebase
import FirebaseAuth
class AddNewMachineModel {
    
    func AddMachine(machine:Machine?) {
        if let name = machine?.name,
            let description = machine?.description,
            let idMachine = machine?.id {
            let database = Database.database().reference()
            let machineRegistration = database.child("Machines")
                machineRegistration.observeSingleEvent(of: .value) { dataSnapshot in
                    let machine = [
                         "machineName" : "\(name)",
                         "description" : "\(description)",
                         "serialNumber" : "\(idMachine)",
                          ]
                     machineRegistration.childByAutoId().setValue(machine)
            }
        }
    }
}

