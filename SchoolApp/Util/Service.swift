import Foundation
import Alamofire

class Service {
    
    static func loadMenuItems() -> [MenuItems] {
        return [
            (MenuItems(image: #imageLiteral(resourceName: "ic_quiz"), label: "Play Quiz",segue: "PlayQuizSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_assignment"), label: "Assignment",segue: "AssignmentSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_holiday"), label: "School Holiday",segue: "AttendanceSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_calendra"), label: "Time Table",segue: "TimeTableSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_results"), label: "Results",segue: "ResultsSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_date_sheet"), label: "Date Sheet",segue: "DateSheetSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_doubts"), label: "Ask Doubts",segue: "AskDoubtsSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_gallery"), label: "School Gallery",segue: "SchoolGallerySegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_leave"), label: "Leave Application",segue: "AskDoubtsSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_password"), label: "Change Password",segue: "ChangePasswordSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_event"), label: "Events",segue: "EventsSegue")),
            (MenuItems(image: #imageLiteral(resourceName: "ic_logout"), label: "Logout",segue: "LogoutSegue"))
        ]
    }
    
    static func getQuizData(completion: @escaping ([Question]) -> ()) {
        AF.request(Constant.QuizURL, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data else { return }
            do {
                let datalist = try JSONDecoder().decode(QuizQuestions.self, from: data)
                completion(datalist.results)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getTimeTablePosts(completion: @escaping ([TimeTablePost]) -> ()) {
        AF.request(Constant.TimeTableURL, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data else { return }
            do {
                let datalist = try JSONDecoder().decode([TimeTablePost].self, from: data)
                completion(datalist)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getToDoItems(completion: @escaping ([ToDoItem]) -> ()) {
        AF.request(Constant.ToDoURL, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data else { return }
            do {
                let datalist = try JSONDecoder().decode([ToDoItem].self, from: data)
                completion(datalist)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getGalleryImages(completion: @escaping ([GalleryImage]) -> ()) {
        AF.request(Constant.GalleryURL, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data else { return }
            do {
                let datalist = try JSONDecoder().decode([GalleryImage].self, from: data)
                completion(datalist)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getRickAndMortys(completion: @escaping ([RickAndMorty]) -> ()) {
        AF.request(Constant.RickAndMorty, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data else { return }
            do {
                let datalist = try JSONDecoder().decode(RickAndMortys.self, from: data)
                completion(datalist.results)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
    
    static func getDrinks(completion: @escaping ([Drink]) -> ()) {
        AF.request(Constant.DrinksURL, method:.get, encoding: JSONEncoding.default).responseJSON { response  in
            guard let data = response.data?[0...19] else { return }
            do {
                let datalist = try JSONDecoder().decode([Drink].self, from: data)
                completion(datalist)
            } catch  {
                print(error.localizedDescription)
            }
        }
    }
}
