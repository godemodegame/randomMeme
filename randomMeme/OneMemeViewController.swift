import UIKit

class OneMemeViewController: UIViewController {

    let memeCardView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 122, g: 120, b: 255)
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 0, g: 104, b: 255)
        view.addSubview(memeCardView)
        setupMemeCardView()
        
    }
    
    func setupMemeCardView() {
        memeCardView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        memeCardView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        memeCardView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        memeCardView.heightAnchor.constraint(equalToConstant: 640).isActive = true
    }
}
