import Foundation

struct Machine {
    var name: String
    var id: String
    var description: String
    var identifier: String?
    init(name: String, id: String, description: String, identifier: String) {
        self.name = name
        self.id = id
        self.description = description
        self.identifier = identifier
    }
}
