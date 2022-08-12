import Foundation

struct Machine {
    var name: String
    var id: String
    var description: String
    var key: String?
    init(name: String, id: String, description: String, key: String) {
        self.name = name
        self.id = id
        self.description = description
    }
}
