//
//  TriviaViewController.swift
//  Trivia
//
//  Created by Maiwand Raheem on 3/13/25.
//

import UIKit

class TriviaViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var typeLabel: UILabel!
    
    @IBOutlet weak var cardLabel: UILabel!
    
    
    @IBOutlet weak var optionOne: UIButton!
    
    
    @IBOutlet weak var OpitonTwo: UIButton!
    
    @IBOutlet weak var optionThree: UIButton!
    
    
    @IBOutlet weak var optionFour: UIButton!
    
    var questions: [TriviaModel] = [
        TriviaModel(type: "Science", question: "What is the chemical symbol for water?", options: ["H2O", "O2", "CO2", "NaCl"], answer: "H2O"),
                TriviaModel(type: "History", question: "Who was the first President of the United States?", options: ["Abraham Lincoln", "George Washington", "John Adams", "Thomas Jefferson"], answer: "George Washington"),
                TriviaModel(type: "Geography", question: "What is the capital of France?", options: ["London", "Rome", "Berlin", "Paris"], answer: "Paris")
    ]
    
    var currentIdx = 0
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadQuestion()
        
        
    }
    
    func loadQuestion() {
        if currentIdx < questions.count {
            let currentquestion = questions[currentIdx]
            questionLabel.text = "Question \(currentIdx + 1)/\(questions.count)"
            typeLabel.text = "Genre: \(currentquestion.type)"
            
            cardLabel.text = questions[currentIdx].question
            
            optionOne.setTitle(currentquestion.options[0], for: .normal)
                       OpitonTwo.setTitle(currentquestion.options[1], for: .normal)
                       optionThree.setTitle(currentquestion.options[2], for: .normal)
                       optionFour.setTitle(currentquestion.options[3], for: .normal)
            
        } else {
            showFinalScore()
        }
    }
    
    
    
    
    @IBAction func answer1(_ sender: UIButton) {
        let currentQuestion = questions[currentIdx]
                
                if sender.currentTitle == currentQuestion.answer {
                    score += 1
                }
                
        currentIdx += 1
                loadQuestion()
    }
    
    @IBAction func answer2(_ sender: UIButton) {
        let currentQuestion = questions[currentIdx]
                
                if sender.currentTitle == currentQuestion.answer {
                    score += 1
                }
                
        currentIdx += 1
                loadQuestion()
    }
    
    
    @IBAction func answer3(_ sender: UIButton) {
        let currentQuestion = questions[currentIdx]
                
                if sender.currentTitle == currentQuestion.answer {
                    score += 1
                }
                
        currentIdx += 1
                loadQuestion()
    }
    
    
    
    @IBAction func answerSelected(_ sender: UIButton) {
        
        let currentQuestion = questions[currentIdx]
                
                if sender.currentTitle == currentQuestion.answer {
                    score += 1
                }
                
        currentIdx += 1
                loadQuestion()
    }
    
    func showFinalScore() {
            let alert = UIAlertController(title: "Game Over", message: "You got \(score) out of \(questions.count) correct!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                self.restartGame()
            }))
            
            present(alert, animated: true, completion: nil)
        }
        
        // Restart the game
        func restartGame() {
            currentIdx = 0
            score = 0
            loadQuestion()
        }

    
}
