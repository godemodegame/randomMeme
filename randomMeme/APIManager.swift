// получаем фото
// https://some-random-api.ml/meme

import Foundation

var meme: Meme?

func loadMeme(completionHandler: (()->Void)?) {
    guard let url = URL(string: "https://meme-api.herokuapp.com/gimme") else { return }

    URLSession(configuration: .default).dataTask(with: url) { (data, responce, error) in
        guard error == nil else {
            print("error==========> \(error!)")
            return
        }
        
        guard data != nil else {
            print("no data")
            return
        }
        meme = try? JSONDecoder().decode(Meme.self, from: data!)
        
        completionHandler?()
    }.resume()
}
