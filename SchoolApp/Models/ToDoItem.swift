import Foundation

struct ToDoItem: Codable {
    var id : Int
    var userId : Int
    var title : String
    var completed : Bool
}
