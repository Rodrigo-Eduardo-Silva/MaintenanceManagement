
import UIKit

class AddNewAccountViewController: UIViewController {

    @IBOutlet weak var newEmailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var IsMechanical: UISwitch!
    
    
    var model =  AddNewAccountModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newEmailTextField.text = "teste@gmail"
        nameTextField.text = "Rodrigo"
        passwordTextField.text = "123456"
        confirmTextField.text = "123456"
        model.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func CreateNewAccount(_ sender: Any) {
        model.CreatAccount(user: User(name: nameTextField.text ?? "User teste", email: newEmailTextField.text ?? "User mail", isMechanical: IsMechanical.isOn, password: passwordTextField.text ?? "User Password"))

    }
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
    func showDidSucess(message: String) {
        let alert = UIAlertController(title: "Maintence Management ", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
}

extension AddNewAccountViewController: AddNewAccountModelDelegate {
    func AddNewAccountDidSuccess() {
        showDidSucess(message: "Usuário Criado com Sucesso")
    }

    func AddNewAccountDidFalil(messagem: String) {
        showLoginError(message: messagem)
    }
}

 
