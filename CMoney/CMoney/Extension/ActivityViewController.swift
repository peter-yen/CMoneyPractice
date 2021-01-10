import UIKit

class ActivityViewController: UIViewController {
    lazy var activityView: UIActivityIndicatorView = {
        let a = UIActivityIndicatorView(style: .large)
        a.color = .white
        a.translatesAutoresizingMaskIntoConstraints = false
        return a
    }()

    override func loadView() {
        self.view = UIView()
        self.view.backgroundColor = UIColor(white: 0, alpha: 0.1)

        self.activityView.startAnimating()
        self.view.addSubview(self.activityView)

        self.activityView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.activityView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
    }
}
