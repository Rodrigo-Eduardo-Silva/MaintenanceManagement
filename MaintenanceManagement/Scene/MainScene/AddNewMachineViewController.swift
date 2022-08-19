import UIKit
import FirebaseAuth
import FirebaseDatabase

class AddNewMachineViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var serialNumerTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextView!
    var model =  AddNewMachineModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.text = "Diejet"
        serialNumerTextField.text = "12345a"
        descriptionTextField.text = "Impressora jato de tinta"
    }

    @IBAction func SaveMachine(_ sender: Any) {
        
        model.AddMachine(machine: Machine(name: nameTextField.text ?? "teste", id: serialNumerTextField.text ?? "1234test", description: descriptionTextField.text ?? "descripton text",identifier: ""))
        print("maquina cadastrada")
    }
 
}
 

    
