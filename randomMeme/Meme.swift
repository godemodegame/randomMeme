import Foundation

struct Meme: Decodable {
    var postLink: URL
    var title: String
    var url: URL
    var subreddit: String
}
