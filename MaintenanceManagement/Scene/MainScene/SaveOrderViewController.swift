import UIKit

class SaveOrderViewController: UIViewController {

    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var chooseDatePicker: UIDatePicker!
    @IBOutlet weak var errorDescriptionLabel: UITextView!
    var model = SaveOrderModel()
    var machine: Machine!
    var order: OrderMaintenance!
    init(machine: Machine) {
        self.machine = machine
        super.init(nibName: "SaveOrderViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chooseDatePicker.minimumDate = Date()
        machineLabel.text  = machine.name
        
    }
    
    @IBAction func sendOrder(_ sender: Any) {
        model.SaveOrder(order: OrderMaintenance(user: model.authUser().0, IdUser: model.authUser().1, date: chooseDatePicker.date, descriptionError: errorDescriptionLabel.text, state: true, machineidentifier: machine.identifier, machineName: machine.name))
        dismiss(animated: true, completion: nil)
    }
    
}

