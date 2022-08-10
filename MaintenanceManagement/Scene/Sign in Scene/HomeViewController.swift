import UIKit


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

   @IBAction func ShowLogin(_ sender: UIButton) {
       let viewController = LoginViewController()
       navigationController?.pushViewController(viewController, animated: true)
    
    }
    @IBAction func ShowAddNewAccount(_ sender: Any) {
        let viewController  = AddNewAccountViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}
