//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var falseButton: UIButton!
    
    @IBOutlet weak var scoreText: UILabel!
    
    var questionNumber = 0
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
                
        let userAnswer = sender.currentTitle!
        
        let userGotItRight =  quizBrain.checkAnswer(answer: userAnswer)
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
            print("Right")
        }else{
            sender.backgroundColor = UIColor.red
            print("Wrong!")
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
    }
    
    @objc func updateUi(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        
        scoreText.text = "Score : \(quizBrain.getScore())"

        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
    }
    
}

