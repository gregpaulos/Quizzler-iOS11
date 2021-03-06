//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let allQuestions = QuestionBank()
    var pickedAnswer: Bool = false
    var questionNum: Int = 0
    var score: Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextQuestion()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        
        checkAnswer()
        
        questionNum += 1
        
        nextQuestion()
       
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionNum+1)/13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionNum + 1)
    }
    

    func nextQuestion() {
        
        if (questionNum >= allQuestions.list.count) {
            let alert = UIAlertController(title: "END OF GAME", message: "WANT TO PLAY AGAIN?", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default, handler: { (UIAlertAction) in
                self.startOver()
            })
            
            alert.addAction(restartAction)
            present(alert, animated: true, completion: nil)
        } else {
            updateUI()
            questionLabel.text = allQuestions.list[questionNum].questionText

        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNum].answer
        if pickedAnswer == correctAnswer {
            score += 1
            
            print("You got it right")
            
            ProgressHUD.showSuccess("Correct")
        }
        else {
            print("WRONG!")
            
            ProgressHUD.showError("WRONG")
        }
    }
    
    
    func startOver() {
       questionNum = 0
        score = 0
        nextQuestion()
    }
    

    
}
