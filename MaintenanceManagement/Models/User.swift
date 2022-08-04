import Foundation

struct User {
    var name: String
    var email: String
    var password: String
    var isMechanical: Bool = false
    init(name: String, email: String ,isMechanical: Bool, password: String) {
        self.name = name
        self.email = email
        self.isMechanical = isMechanical
        self.password = password
    }
 }
