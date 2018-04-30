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
            questionLabel.text = allQuestions.list[questionNum].questionText

        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = allQuestions.list[questionNum].answer
        if pickedAnswer == correctAnswer {
            print("You got it right")
        }
        else {
            print("WRONG!")
        }
    }
    
    
    func startOver() {
       questionNum = 0
        nextQuestion()
    }
    

    
}
