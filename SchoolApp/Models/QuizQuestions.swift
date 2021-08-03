import Foundation

struct QuizQuestions: Codable {
    let response_code : Int
    let results: [Question]
}

struct Question : Codable {
    let category : String
    let question : String
    let correct_answer : String
    let incorrect_answers : [String]
}

