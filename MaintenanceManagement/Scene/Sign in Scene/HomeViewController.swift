import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    func userDidLogin () {
        let auth = Auth.auth()
        auth.addStateDidChangeListener { _, userData in
            if let userLogged =  userData {

            }
        }
    }

   @IBAction func showLogin(_ sender: UIButton) {
       let viewController = LoginViewController()
       navigationController?.pushViewController(viewController, animated: true)

    }
    @IBAction func showAddNewAccount(_ sender: Any) {
        let viewController  = AddNewAccountViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
}
