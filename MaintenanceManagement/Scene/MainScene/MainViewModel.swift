import Foundation
import SwiftUI
protocol MainViewModelDelegate: AnyObject {
    func mechanicalTabBar(viewControllers: [UIViewController])
    func userTabBar(viewControllers: [UIViewController])
}
class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    var isMechanical: Bool!
    var order: OrderMaintenance!

    func configureTabBar(isMechanical: Bool) {
        if isMechanical == false {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController(isMechanical: isMechanical)
            let OpenOrderViewController = OpenOrdeViewController()
            let viewControlles = [OrderListViewController, OpenOrderViewController, AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            OpenOrderViewController.title = "Abrir Chamado"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.userTabBar(viewControllers: viewControlles)
        }
        if isMechanical == true {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController(isMechanical: isMechanical)
            let viewControlles = [OrderListViewController, AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.mechanicalTabBar(viewControllers: viewControlles)
        }
    }
}
