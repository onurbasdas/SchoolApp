import Foundation

struct RickAndMortys: Codable {
    var results : [RickAndMorty]
}

struct RickAndMorty: Codable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
}
