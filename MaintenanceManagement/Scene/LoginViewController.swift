import UIKit
import FirebaseAuth
class LoginViewController: UIViewController {

    @IBOutlet weak var emailLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLoginTextField.text = "teste@gmail.com"
        passwordLoginTextField.text = "123456"
         // Do any additional setup after loading the view.
    }

    @IBAction func signin(_ sender: Any) {
        if let userEmail = self.emailLoginTextField.text , let password = self.passwordLoginTextField.text {
            let auth = Auth.auth()
            auth.signIn(withEmail: userEmail, password: password) { dataUser, error in
                if error == nil {
                    if dataUser == nil {
                        self.showLoginError(message: "Problema ao aunteticar o usuário, tente novamente")
                    } else {
                      let viewController = MainViewController()
                        self.navigationController?.pushViewController(viewController, animated: true)
                    }
                } else {
                    if let error = error as NSError? {
                        self.showLoginError(message: error.localizedDescription)
                    }
                }
            }
        }
    }
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
}
