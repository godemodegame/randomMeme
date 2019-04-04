import UIKit

class ViewController: UIViewController {
    
    let pressMeLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bradley Hand", size: 26)
        label.text = "Tap the screen"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let pressMeButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .clear
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(presentMemeViewController), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(r: 0, g: 104, b: 255)
        
        view.addSubview(pressMeLabel)
        setupPressMeLabel()
        
        view.addSubview(pressMeButton)
        setupPressMeButton()
    }
    
    func setupPressMeLabel() {
        pressMeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pressMeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func setupPressMeButton() {
        pressMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pressMeButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        pressMeButton.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        pressMeButton.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
    }
    
    @objc func presentMemeViewController() {
        let oneMemeViewController = OneMemeViewController()
        present(oneMemeViewController, animated: true, completion: nil)
        loadMeme {
            DispatchQueue.main.async {
                guard let meme = meme,
                      let data = try? Data(contentsOf: meme.url) else { return }
                oneMemeViewController.titleLabel.text = meme.title
                oneMemeViewController.memeImageView.image = UIImage(data: data)
                oneMemeViewController.activityIndicator.stopAnimating()
            }
        }
    }
}
