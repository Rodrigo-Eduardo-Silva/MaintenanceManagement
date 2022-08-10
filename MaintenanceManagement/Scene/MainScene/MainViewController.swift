import UIKit

class MainViewController: UITabBarController {
   
    override func viewDidLoad() {
      
      setupTabbarMenu()
       
 }
    func setupTabbarMenu() {
        let AddNewMachineViewController = AddNewMachineViewController()
        let OrderListViewController = OrderListViewController()
        let OpenOrderViewController = OpenOrdeViewController()
        let viewControlles = [OrderListViewController,OpenOrderViewController,AddNewMachineViewController]
        AddNewMachineViewController.title = "Adicionar Nova Máquina"
        OpenOrderViewController.title = "Abrir Chamado"
        OrderListViewController.title = "Chamados Abertos"
        self.setViewControllers(viewControlles, animated: false)
        guard let items = self.tabBar.items else { return }
        let images = ["list.dash","square.and.arrow.down","printer.dotmatrix.filled.and.paper"]
        for tabImage in 0...(images.count - 1) {
            items[tabImage].image = UIImage(systemName: images[tabImage])
        }
        self.tabBar.backgroundColor = .gray
        self.tabBar.tintColor = UIColor(named: "System teal Color")
          
    }
 

}

