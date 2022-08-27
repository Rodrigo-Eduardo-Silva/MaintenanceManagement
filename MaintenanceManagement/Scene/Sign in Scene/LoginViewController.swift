import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailLoginTextField: UITextField!
    @IBOutlet weak var passwordLoginTextField: UITextField!
    let model = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emailLoginTextField.text = "rodrigo@gmail.com"
        passwordLoginTextField.text = "123456"
        model.delegate = self
    }

    @IBAction func signin(_ sender: Any) {
        executeLogin()
    }
    
    func executeLogin() {
        let emailLogin =  emailLoginTextField.text ?? ""
        let password = passwordLoginTextField.text ??  ""
        model.login(user: emailLogin, password: password)
    }
    
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Cancelar", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
}

extension LoginViewController: LoginViewModelDelegate {
    func showMainViewController(isMechanical: Bool) {
        let viewController = MainViewController(isMechanical: isMechanical)
        self.navigationController?.pushViewController(viewController, animated: true)
    }

    func loginViewModelDidFail(message: String) {
        showLoginError(message: message)
    }
}
