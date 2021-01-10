import UIKit

class DisplayCollectionViewCell: UICollectionViewCell {
    
    var data: Data! {
        didSet {
            self.idLabel.text = "\(self.data.id)"
            self.titleLabel.text = self.data.title
        }
    }
    
    lazy var idLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "Noteworthy-Bold", size: 12)
        l.textAlignment = .center
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    lazy var titleLabel: UILabel = {
        let l = UILabel()
        l.font = UIFont(name: "HelveticaNeue-BoldItalic", size: 12)
        l.textAlignment = .center
        l.textColor = .black
        l.numberOfLines = 0
        l.lineBreakMode = .byWordWrapping
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    lazy var thumbnailImageView: UIImageView = {
        let v = UIImageView()
        v.contentMode = .scaleAspectFill
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupSubviews()
    }
    
    func setupSubviews() {
        
        self.addSubview(self.thumbnailImageView)
        self.thumbnailImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.thumbnailImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.thumbnailImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        self.thumbnailImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        
        self.addSubview(self.idLabel)
        self.idLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15).isActive = true
        self.idLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(self.titleLabel)
        self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.titleLabel.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
