import UIKit

class DisplayViewController: UIViewController {
    
    var dataArray: [Data] = []
    
    convenience init(datas: [Data]) {
        self.init()
        self.dataArray = datas
    }
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let c = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        c.delegate = self
        c.dataSource = self
        c.register(DisplayCollectionViewCell.self, forCellWithReuseIdentifier: "displayCollectionViewCell")
        c.translatesAutoresizingMaskIntoConstraints = false
        return c
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configureUI()
    }
    
    func configureUI() {
        self.title = "Display"
        
        self.view.addSubview(self.collectionView)
        self.collectionView.backgroundColor = .white
        self.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor).isActive = true
        self.collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
    }
    
}


extension DisplayViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "displayCollectionViewCell", for: indexPath) as! DisplayCollectionViewCell
        let data = self.dataArray[indexPath.item]
        
        cell.data = data
        cell.thumbnailImageView.cacheImage(urlString: data.thumbnailURL)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = collectionView.frame.width / 4
        let height = collectionView.frame.height * 0.2
        let size = CGSize(width: width, height: height)
        
        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let data = self.dataArray[indexPath.item]
        
        let detailVC = DetailViewController(data: data)
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
}
