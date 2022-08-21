import Foundation
import FirebaseAuth
import FirebaseDatabase
protocol LoginViewModelDelegate: AnyObject {
    func ShowMainViewController(isMechanical: Bool)
    func LoginViewModelDidFail(message: String)
}

class LoginViewModel {
    var isMechanical: Bool = false
    weak var delegate: LoginViewModelDelegate?
    
     func login(user: String?, password: String?){
        if let userEmail = user , let password = password {
            let auth = Auth.auth()
            auth.signIn(withEmail: userEmail, password: password) { dataUser, error in
                if error == nil {
                    self.validateUser(userID: dataUser?.user.uid ?? "teste")
                    if dataUser == nil {
                        self.delegate?.LoginViewModelDidFail(message: "Problema ao aunteticar o usuário, tente novamente")
                    } else {
                        self.delegate?.ShowMainViewController(isMechanical: self.isMechanical)
                    }
                } else {
                    if let error = error as NSError? {
                        self.delegate?.LoginViewModelDidFail(message: error.localizedDescription)
                    }
                }
            }
        }
    }
    func validateUser(userID: String) {
        let database = Database.database().reference()
        let userPath = database.child("Users")
        let user = userPath.child(userID)
        user.observeSingleEvent(of: .value) { dataUser in
            let dados = dataUser.value as? NSDictionary
            if dados == nil {
                self.isMechanical = false
            } else {
                self.isMechanical = true
            }
        }
    }
}
