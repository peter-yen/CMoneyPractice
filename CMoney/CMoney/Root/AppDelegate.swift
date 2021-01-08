import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        self.configure()
        
        return true
    }
    
    func configure() {
        self.setupRootViewController()
        self.configureUI()
    }
    
    func setupRootViewController() {
        self.window?.makeKeyAndVisible()
        
        let mainNC = UINavigationController.init(rootViewController: MainViewController())
        self.window?.rootViewController = mainNC
    }
    
    func configureUI() {
        let navigationAppearance = UINavigationBar.appearance()
        navigationAppearance.barTintColor = .systemRed
    }
    
}

