import Foundation
import SwiftUI
protocol MainViewModelDelegate: AnyObject {
    func MechanicalTabBar(viewControllers:[UIViewController])
    func UserTabBar(viewControllers:[UIViewController])
}
class MainViewModel {
    weak var delegate: MainViewModelDelegate?
    var IsMechanical: Bool!
   
    func ConfigureTabBar(IsMechanical: Bool) {
        if IsMechanical == false {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController()
            let OpenOrderViewController = OpenOrdeViewController()
            let viewControlles = [OrderListViewController,OpenOrderViewController,AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            OpenOrderViewController.title = "Abrir Chamado"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.UserTabBar(viewControllers: viewControlles)
        }
        if IsMechanical == true {
            let AddNewMachineViewController = AddNewMachineViewController()
            let OrderListViewController = OrderListViewController()
            let CloseOrderViewController = CloseOrderViewController()
            let viewControlles = [OrderListViewController,CloseOrderViewController,AddNewMachineViewController]
            AddNewMachineViewController.title = "Adicionar Nova Máquina"
            CloseOrderViewController.title = "Encerrar Chamado"
            OrderListViewController.title = "Chamados Abertos"
            delegate?.MechanicalTabBar(viewControllers: viewControlles)
        }
    }
}
    

