import UIKit

class CloseOrderViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var machineLabel: UILabel!
    @IBOutlet weak var idMachineLabel: UILabel!
    @IBOutlet weak var descriptionErrorLabel: UITextView!
    @IBOutlet weak var closerOrderButton: UIButton!
    var order: OrderMaintenance
    
    init(order: OrderMaintenance) {
        self.order = order
        super.init(nibName: "CloseOrderViewController ", bundle: nil)
 
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

}
