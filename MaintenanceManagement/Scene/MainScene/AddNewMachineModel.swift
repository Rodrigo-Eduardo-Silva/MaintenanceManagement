import Foundation
import FirebaseDatabase
import Firebase
class AddNewMachineMode {
    var machine: Machine
    init(machine: Machine){
        self.machine = machine
        
    }
    func AddMachine(machine:Machine?) {
        if let name = machine?.name, let description = machine?.description, let idMachine = machine?.id {
            let database = Database.database().reference()
            let machine = database.child("Machines")
            
        }
        
    }
    
}

