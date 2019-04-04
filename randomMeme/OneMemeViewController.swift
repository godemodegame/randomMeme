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
    
    let originalButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 206, g: 201, b: 255)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Original", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bradley Hand", size: 26)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = UIColor(r: 206, g: 201, b: 255)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setTitle("Next", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont(name: "Bradley Hand", size: 26)
        button.titleLabel?.textColor = .black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(updateMeme), for: .touchUpInside)
        return button
    }()
    
    let moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "moreButton"), for: .normal)
        button.tintColor = UIColor(r: 206, g: 201, b: 255)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "favoriteButton"), for: .normal)
        button.tintColor = UIColor(r: 206, g: 201, b: 255)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let memeImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Bradley Hand", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        return activityIndicator
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
        
        memeCardView.addSubview(originalButton)
        
        originalButton.bottomAnchor.constraint(equalTo: memeCardView.bottomAnchor, constant: -10).isActive = true
        originalButton.leftAnchor.constraint(equalTo: memeCardView.leftAnchor, constant: 10).isActive = true
        originalButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        originalButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        memeCardView.addSubview(nextButton)
        
        nextButton.bottomAnchor.constraint(equalTo: memeCardView.bottomAnchor, constant: -10).isActive = true
        nextButton.rightAnchor.constraint(equalTo: memeCardView.rightAnchor, constant: -10).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 160).isActive = true
        nextButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        memeCardView.addSubview(moreButton)
        
        moreButton.leftAnchor.constraint(equalTo: memeCardView.leftAnchor, constant: 25).isActive = true
        moreButton.topAnchor.constraint(equalTo: memeCardView.topAnchor, constant: 23).isActive = true
        moreButton.widthAnchor.constraint(equalToConstant: 55).isActive = true
        moreButton.heightAnchor.constraint(equalToConstant: 15).isActive = true
        
        memeCardView.addSubview(favoriteButton)
        
        favoriteButton.rightAnchor.constraint(equalTo: memeCardView.rightAnchor, constant: -20).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: memeCardView.topAnchor, constant: 10).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        memeCardView.addSubview(memeImageView)
        
        memeImageView.leftAnchor.constraint(equalTo: memeCardView.leftAnchor).isActive = true
        memeImageView.rightAnchor.constraint(equalTo: memeCardView.rightAnchor).isActive = true
        memeImageView.bottomAnchor.constraint(equalTo: originalButton.topAnchor, constant: -3).isActive = true
        memeImageView.topAnchor.constraint(equalTo: favoriteButton.bottomAnchor).isActive = true
        
        memeCardView.addSubview(titleLabel)
        
        titleLabel.centerXAnchor.constraint(equalTo: memeCardView.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: memeCardView.topAnchor, constant: 17).isActive = true
        
        memeCardView.addSubview(activityIndicator)
        
        activityIndicator.centerXAnchor.constraint(equalTo: memeCardView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: memeCardView.centerYAnchor).isActive = true
    }
    
    @objc func updateMeme() {
        memeImageView.image = nil
        titleLabel.text = ""
        activityIndicator.startAnimating()
        loadMeme {
            DispatchQueue.main.async {
                guard let meme = meme,
                      let data = try? Data(contentsOf: meme.url) else { return }
                self.titleLabel.text = meme.title
                self.memeImageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
            }
        }
    }
}
