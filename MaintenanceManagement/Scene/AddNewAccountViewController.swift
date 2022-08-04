
import UIKit

class AddNewAccountViewController: UIViewController {

    @IBOutlet weak var newEmailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var confirmText: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var IsMechanical: UISwitch!
    
    
    var model =  AddNewAccountModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        newEmailText.text = "teste@gmail"
        name.text = "Rodrigo"
        passwordText.text = "123456"
        model.delegate = self
        // Do any additional setup after loading the view.
    }

    @IBAction func CreateNewAccount(_ sender: Any) {
        model.CreatAccount(user: User(name: name.text ?? "User teste", email: newEmailText.text ?? "User mail", isMechanical: IsMechanical.isOn, password: passwordText.text ?? "User Password"))

    }
    func showLoginError(message: String) {
        let alert = UIAlertController(title: "Falha de login", message: message, preferredStyle: .alert)
        let button = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(button)
        present(alert, animated: true)
    }
}

extension AddNewAccountViewController: AddNewAccountModelDelegate {
    func AddNewAccountDidSuccess() {
        showLoginError(message: "SUCESSO")
    }

    func AddNewAccountDidFalil(messagem: String) {
        showLoginError(message: messagem)
    }
}

 
