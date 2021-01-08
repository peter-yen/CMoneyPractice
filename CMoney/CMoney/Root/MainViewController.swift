import UIKit

class MainViewController: UIViewController {
    var datas: [Data] = []
    
    private lazy var nextPageButton: UIButton = {
        let b = UIButton()
        b.setTitle("Next", for: .normal)
        b.addTarget(self, action: #selector(nextPageButtonDidTap), for: .touchUpInside)
        b.backgroundColor = .blue
        b.clipsToBounds = true
        b.alpha = 0.4
        b.isEnabled = false
        b.layer.cornerRadius = 15
        b.translatesAutoresizingMaskIntoConstraints = false
        return b
    }()
    
    @objc func nextPageButtonDidTap() {
        let displayCollectionVC = DisplayViewController(datas: self.datas)
        self.navigationController?.pushViewController(displayCollectionVC, animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configure()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.nextPageButton.alpha = 1
            self.nextPageButton.isEnabled = true
        }
    }
    
    func configure() {
        self.configureData()
        self.configureUI()
    }
    
    func configureUI() {
        self.title = "Main"
        self.view.backgroundColor = .systemRed
        
        self.view.addSubview(self.nextPageButton)
        self.nextPageButton.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.25).isActive = true
        self.nextPageButton.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.05).isActive = true
        self.nextPageButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.nextPageButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
    func configureData() {
        
        API.shared.getJsonData { (datas) in
            self.datas = datas
            
        } failure: { (err) in
            print(err.localizedDescription)
            return
        }
    }
    
}
