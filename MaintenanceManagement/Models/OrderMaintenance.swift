import Foundation
struct OrderMaintenance {
    var user: String
    var IdUser: String
    var date: Date
    var descriptionError: String
    var state: Bool
    var machine: Machine
    init(user: String, IdUser: String, date: Date, descriptionError: String, state: Bool, machine: Machine) {
        self.user = user
        self.IdUser = IdUser
        self.date = date
        self.descriptionError = descriptionError
        self.state = true
        self.machine = machine
    }
}
