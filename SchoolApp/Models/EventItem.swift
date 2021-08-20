import Foundation

struct EventItem: Codable {
    var id: Int
    var name: String
    var status: String
    var gender: String
    var image: String
    var species: String
    var body: String
    
    init(id:Int,name:String,status:String,gender:String,image:String,species:String,body:String) {
        self.id = id
        self.name = name
        self.status = status
        self.gender = gender
        self.image = image
        self.species = species
        self.body = body
    }
}
