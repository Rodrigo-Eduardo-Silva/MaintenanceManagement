import Foundation
import Firebase
import FirebaseDatabase

protocol AddNewAccountModelDelegate: AnyObject {
    func AddNewAccountDidSuccess()
    func AddNewAccountDidFalil(messagem: String)
}
class AddNewAccountModel {
    weak var delegate: AddNewAccountModelDelegate?
    func CreatAccount(user: User?) {
        if let  name = user?.name , let email = user?.email, let password = user?.password , let IsMechanical = user?.isMechanical {
            let authentication = Auth.auth()
            authentication.createUser(withEmail: email, password: password) { AuthData, error in
                if error == nil {
                    let database = Database.database().reference()
                    var typeUser: String {
                        switch IsMechanical {
                        case true:
                            return "Mechanical"
                        case false:
                            return "Users"
                        }
                    }
                    let user = database.child(typeUser)
                    let userData = ["Name": name , "email": email]
                    guard let AuthData = AuthData else {
                        fatalError()
                    }
                    user.child(AuthData.user.uid).setValue(userData)
                    self.delegate?.AddNewAccountDidSuccess()
                } else {
                    self.delegate?.AddNewAccountDidFalil(messagem: error?.localizedDescription ?? "Falha ao Criar Usuário")
                }
            }
        }
    }
}
