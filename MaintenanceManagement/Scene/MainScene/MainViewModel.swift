import Foundation
import SwiftUI
protocol MainViewModelDelegate: AnyObject {
    func mechanicalTabBar(viewControllers: [UIViewController])
    func userTabBar(viewControllers: [UIViewController])
}
class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    var isMechanical: Bool!

    func configureTabBar(isMechanical: Bool) {
        if isMechanical == false {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController()
            let OpenOrderViewController = OpenOrdeViewController()
            let viewControlles = [OrderListViewController, OpenOrderViewController, AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            OpenOrderViewController.title = "Abrir Chamado"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.userTabBar(viewControllers: viewControlles)
        }
        if isMechanical == true {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController()
            let CloseOrderViewController = CloseOrderViewController()
            let viewControlles = [OrderListViewController, CloseOrderViewController, AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            CloseOrderViewController.title = "Encerrar Chamado"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.mechanicalTabBar(viewControllers: viewControlles)
        }
    }
}
