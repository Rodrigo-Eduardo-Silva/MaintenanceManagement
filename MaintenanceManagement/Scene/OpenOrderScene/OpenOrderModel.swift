import Foundation
import FirebaseDatabase
protocol OpenOrderModelDelegate: AnyObject {
    func updateOpenOrderModel()
}
class OpenOrderModel {
    var machines: [Machine] = []
    weak var delegate: OpenOrderModelDelegate?
    
    func updateMachine() {
        let database = Database.database().reference()
        let machineData = database.child("Machines")
        machineData.observe(.childAdded) { dataSnapshot in
            let data = dataSnapshot.value as? NSDictionary
            let machine = Machine(name: data?["machineName"] as? String ?? "teste",
                                  id: data?["SerialNumber"] as? String  ?? "teste",
                                  description: data?["description"] as? String ?? "teste",
                                  identifier: dataSnapshot.key)
            self.machines.append(machine)
            self.delegate?.updateOpenOrderModel()
        }
        machineData.observe(.childRemoved) { dataSnapShot in
            var index = 0
            for machine in self.machines {
                if machine.identifier == dataSnapShot.key {
                    self.machines.remove(at: index)
                }
                index += 1
                self.delegate?.updateOpenOrderModel()
            }
        }
    }
    
}
