import Foundation
import Firebase
import FirebaseDatabase

protocol AddNewAccountModelDelegate: AnyObject {
    func addNewAccountDidSuccess()
    func addNewAccountDidFalil(messagem: String)
}

class AddNewAccountModel {
    weak var delegate: AddNewAccountModelDelegate?
    
    func createAccount(user: User?) {
        if let  name = user?.name, let email = user?.email, let password = user?.password, let isMechanical = user?.isMechanical {
            let authentication = Auth.auth()
            
            authentication.createUser(withEmail: email, password: password) { authData, error in
                if error == nil {
                    let database = Database.database().reference()
                    
                    var typeUser: String {
                        switch isMechanical {
                        case true:
                            return "Mechanical"
                        case false:
                            return "User"
                        }
                    }
                    
                    let user = database.child("Users")
                    
                    let userData: [String : Any] = [
                        "Name": name as String ,
                        "email": email as String ,
                        "isMechanical": isMechanical as Bool
                    ]
                    
                    guard let authData = authData else {
                        fatalError()
                    }
                    
                    user.child(authData.user.uid).setValue(userData)
                    self.delegate?.addNewAccountDidSuccess()
                } else {
                    self.delegate?.addNewAccountDidFalil(messagem: error?.localizedDescription ?? "Falha ao Criar Usuário")
                }
            }
        }
    }
}
