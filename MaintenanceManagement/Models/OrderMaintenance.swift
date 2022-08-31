import Foundation
import SwiftUI
struct OrderMaintenance {
    enum state: String {
        case opened = "opened"
        case closed = "closed"
    }
    var user: String
    var idUser: String
    var date: Date
    var descriptionError: String
    var state: state
    var machineIdentifier: String
    var machineName: String
    var orderIdentifier: String?
    init(user: String, idUser: String, date: Date, descriptionError: String, state: String, machineidentifier: String, machineName: String, orderIdentifier: String) {
        self.user = user
        self.idUser = idUser
        self.date = date
        self.descriptionError = descriptionError
        self.state = .opened
        self.machineIdentifier = machineidentifier
        self.machineName = machineName
        self.orderIdentifier = orderIdentifier
    }
}
