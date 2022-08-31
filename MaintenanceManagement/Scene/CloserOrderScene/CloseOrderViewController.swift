import UIKit

class CloseOrderViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var idMachineLabel: UILabel!
    @IBOutlet weak var descriptionErrorLabel: UITextView!
    @IBOutlet weak var closerOrderButton: UIButton!
    var order: OrderMaintenance
    var model = CloseOrderModel()
    
    init(order: OrderMaintenance) {
        self.order = order
        super.init(nibName: "CloseOrderViewController", bundle: nil)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userLabel.text = order.user
        dateLabel.text = DateFormatter.localizedString(from: order.date, dateStyle: .short, timeStyle: .none)
        machineLabel.text = order.machineName
        idMachineLabel.text = order.machineIdentifier
        descriptionErrorLabel.text = order.descriptionError
       
    }

    @IBAction func closeOrder(_ sender: Any) {
        model.saveOrder(orderIdentifier: self.order.orderIdentifier ?? "teste")
        dismiss(animated: true, completion: nil)
    }
}

