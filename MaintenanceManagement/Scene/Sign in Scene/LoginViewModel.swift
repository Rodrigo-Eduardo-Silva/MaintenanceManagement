import Foundation
import FirebaseAuth
import FirebaseDatabase
import SwiftUI
protocol LoginViewModelDelegate: AnyObject {
    func showMainViewController(isMechanical: Bool)
    func loginViewModelDidFail(message: String)
}

class LoginViewModel {
    var isMechanical: Bool = true

    weak var delegate: LoginViewModelDelegate?

     func login(user: String?, password: String?) {
        if let userEmail = user, let password = password {
            let auth = Auth.auth()
            auth.signIn(withEmail: userEmail, password: password) { dataUser, error in
                if error == nil {
                    if dataUser == nil {
                        self.delegate?.loginViewModelDidFail(message: "Problema ao aunteticar o usuário, tente novamente")
                    } else {
                        self.validateUser(userID: dataUser?.user.uid ?? "teste")
                    }
                } else {
                    if let error = error as NSError? {
                        self.delegate?.loginViewModelDidFail(message: error.localizedDescription)
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
            let data = dataUser.value as? NSDictionary
            guard  let typeUser = data?["isMechanical"] as? Bool else {
                fatalError()
            }
            self.isMechanical = typeUser
            self.delegate?.showMainViewController(isMechanical: self.isMechanical)
        }
    }
}
