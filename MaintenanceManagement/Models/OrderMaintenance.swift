import Foundation
struct OrderMaintenance {
    var user: String
    var idUser: String
    var date: Date
    var descriptionError: String
    var state: Bool
    var machineIdentifier: String
    var machineName: String
    init(user: String, idUser: String, date: Date, descriptionError: String, state: Bool, machineidentifier: String, machineName: String) {
        self.user = user
        self.idUser = idUser
        self.date = date
        self.descriptionError = descriptionError
        self.state = true
        self.machineIdentifier = machineidentifier
        self.machineName = machineName
    }
}
