import UIKit

class DetailViewController: UIViewController {
    var data: Data!
    
    convenience init(data: Data) {
        self.init()
        self.data = data
        
        API.shared.downLoadImageURL(url: self.data.thumbnailURL) { (image) in
            self.detailImageView.image = image
        } failure: { (err) in
            print(err.localizedDescription)
            return
        }
        self.detailIdLabel.text = "\(self.data.id)"
        self.detailTitleLabel.text = self.data.title
    }
    
    private lazy var detailImageView: UIImageView = {
       let v = UIImageView()
        v.clipsToBounds = true
        v.contentMode = .scaleAspectFill
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    private lazy var detailIdLabel: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "Noteworthy-Bold", size: 16)
        l.textAlignment = .center
        l.textColor = .systemRed
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    private lazy var detailTitleLabel: UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "HelveticaNeue-BoldItalic", size: 15)
        l.textAlignment = .center
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.textColor = .black
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configureUI()
    }
    
    func configureUI() {
        self.title = "\(self.data.id)"
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.detailImageView)
        self.detailImageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.detailImageView.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
        self.detailImageView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.3).isActive = true
        
        self.view.addSubview(self.detailIdLabel)
        self.detailIdLabel.topAnchor.constraint(equalTo: self.detailImageView.bottomAnchor, constant: 15).isActive = true
        self.detailIdLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        self.view.addSubview(self.detailTitleLabel)
        self.detailTitleLabel.topAnchor.constraint(equalTo: self.detailIdLabel.bottomAnchor, constant: 15).isActive = true
        self.detailTitleLabel.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8).isActive = true
        self.detailTitleLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
    }
    
}
