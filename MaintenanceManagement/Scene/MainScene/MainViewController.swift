import UIKit

class MainViewController: UITabBarController {
    var IsMechanical: Bool
    init(IsMechanical: Bool){
        self.IsMechanical = IsMechanical
        super.init(nibName: "MainViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    let model = MainViewModel()
    override func viewDidLoad() {
        model.delegate = self
        print(IsMechanical)
        model.ConfigureTabBar(IsMechanical: IsMechanical)
    }
}
extension MainViewController: MainViewModelDelegate {
    func MechanicalTabBar(viewControllers: [UIViewController]) {
        self.setViewControllers(viewControllers, animated: false)
        guard let items = self.tabBar.items else { return }
        let images = ["list.dash","gearshape.2","printer.dotmatrix.filled.and.paper"]
        for tabImage in 0...(images.count - 1) {
            items[tabImage].image = UIImage(systemName: images[tabImage])
        }
        self.tabBar.backgroundColor = .gray
        self.tabBar.tintColor = UIColor(named: "System teal Color")
        print("mechanical")
    }
    func UserTabBar(viewControllers: [UIViewController]) {
        self.setViewControllers(viewControllers, animated: false)
        guard let items = self.tabBar.items else { return }
        let images = ["list.dash","square.and.arrow.down","printer.dotmatrix.filled.and.paper"]
        for tabImage in 0...(images.count - 1) {
            items[tabImage].image = UIImage(systemName: images[tabImage])
        }
        self.tabBar.backgroundColor = .gray
        self.tabBar.tintColor = UIColor(named: "System teal Color")
        print("user")
    }
}
