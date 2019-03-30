import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var memeImageView: UIImageView!
    @IBOutlet weak var pressMeLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func pressedScreen(_ sender: UIButton) {
        memeImageView.image = nil
        pressMeLabel.text = ""
        activityIndicator.startAnimating()
        loadMeme {
            DispatchQueue.main.async {
                guard let meme = meme,
                    let data = try? Data(contentsOf: meme.url) else { return }
                self.memeImageView.image = UIImage(data: data)
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
