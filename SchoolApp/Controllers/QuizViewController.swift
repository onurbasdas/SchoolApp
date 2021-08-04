import UIKit

class QuizViewController: UIViewController {
    
    
    struct Option {
        var optionText : String
        var isCorrect : Bool
        init(optionT: String, isC: Bool) {
            optionText = optionT
            isCorrect = isC
        }
    }
    struct OptionsForOneQuestion {
        var options : [Option]
        init(opts: [Option]) {
            options = opts
        }
    }
    var options = [OptionsForOneQuestion]()
    var questions = [String]()
    var questionNumber = -1
    var correctNumber = 0
    var incorrectNumber = 0
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var option1: UIButton!
    @IBOutlet weak var option2: UIButton!
    @IBOutlet weak var option3: UIButton!
    @IBOutlet weak var option4: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getQuiz()
    }
    
    
    func getQuiz() {
        DispatchQueue.main.async {
            Service.getQuizData { [self] result in
                placeQuestionsAndOptions(questionsData: result)
                nextQuestion()
            }
        }
    }
    
    func placeQuestionsAndOptions(questionsData: [Question]) {
        for item in questionsData {
            var optionsForOneQuestion = OptionsForOneQuestion(opts: [])
            optionsForOneQuestion.options.append(Option(optionT: item.correct_answer, isC: true))
            optionsForOneQuestion.options.append(Option(optionT: item.incorrect_answers[0], isC: false))
            optionsForOneQuestion.options.append(Option(optionT: item.incorrect_answers[1], isC: false))
            optionsForOneQuestion.options.append(Option(optionT: item.incorrect_answers[2], isC: false))
            optionsForOneQuestion.options.shuffle()
            options.append(optionsForOneQuestion)
            questions.append(item.question)
        }
    }
    
    func nextQuestion() {
        questionNumber += 1
        if questionNumber >= questions.count {
            makeQuizSummary()
            //            questionLabel.text = "No more questions"
            //            option1.setTitle("-", for: .normal)
            //            option2.setTitle("-", for: .normal)
            //            option3.setTitle("-", for: .normal)
            //            option4.setTitle("-", for: .normal)
        }
        else{
            questionLabel.text = questions[questionNumber]
            option1.setTitle(options[questionNumber].options[0].optionText, for: .normal)
            option2.setTitle(options[questionNumber].options[1].optionText, for: .normal)
            option3.setTitle(options[questionNumber].options[2].optionText, for: .normal)
            option4.setTitle(options[questionNumber].options[3].optionText, for: .normal)
        }
    }
    
    func resetQuestion() {
        option1.setImage(UIImage(named: "option"), for: .normal)
        option2.setImage(UIImage(named: "option"), for: .normal)
        option3.setImage(UIImage(named: "option"), for: .normal)
        option4.setImage(UIImage(named: "option"), for: .normal)
        
    }
    
    @IBAction func option1Click(_ sender: Any) {
        chooseAnswer(optionNumber: 0)
    }
    @IBAction func option2Click(_ sender: Any) {
        chooseAnswer(optionNumber: 1)
    }
    @IBAction func option3Click(_ sender: Any) {
        chooseAnswer(optionNumber: 2)
    }
    @IBAction func option4Click(_ sender: Any) {
        chooseAnswer(optionNumber: 3)
    }
    
    func chooseAnswer(optionNumber: Int) {
        if options[questionNumber].options[optionNumber].isCorrect {
            correctNumber += 1
            switch optionNumber {
            case 0:
                option1.setImage(UIImage(named: "option-3"), for: .normal)
                break;
            case 1:
                option2.setImage(UIImage(named: "option-3"), for: .normal)
                break;
            case 2:
                option3.setImage(UIImage(named: "option-3"), for: .normal)
                break;
            case 3:
                option4.setImage(UIImage(named: "option-3"), for: .normal)
                break;
            default:
                break;
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resetQuestion()
                self.nextQuestion()
            }
        }
        else{
            incorrectNumber += 1
            switch optionNumber {
            case 0:
                option1.setImage(UIImage(named: "option-2"), for: .normal)
                break;
            case 1:
                option2.setImage(UIImage(named: "option-2"), for: .normal)
                break;
            case 2:
                option3.setImage(UIImage(named: "option-2"), for: .normal)
                break;
            case 3:
                option4.setImage(UIImage(named: "option-2"), for: .normal)
                break;
            default:
                break;
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.resetQuestion()
                self.nextQuestion()
            }
        }
    }
    
    func makeQuizSummary() {
        let alert = UIAlertController(title: "Quiz Summary", message: "Correct Answers: \(correctNumber) \n Incorrect Answers: \(incorrectNumber)", preferredStyle: UIAlertController.Style.alert)
        let tryButton = UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default) { error in
            //self.loadHomeScreen(identifier: "QuizViewController")
            self.performSegue(withIdentifier: "PlayQuizSegue", sender: nil)
        }
        
        alert.addAction(tryButton)
        let quitButton = UIAlertAction(title: "Quit to Main Menu", style: UIAlertAction.Style.destructive) { error in
            self.loadHomeScreen(identifier: "NavigationController")
        }
        alert.addAction(quitButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func loadHomeScreen(identifier: String) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainTabBarController = storyBoard.instantiateViewController(identifier: identifier)
        mainTabBarController.modalPresentationStyle = .fullScreen
        mainTabBarController.modalTransitionStyle = .crossDissolve
        self.present(mainTabBarController, animated: true, completion: nil)
    }
    
    
}
