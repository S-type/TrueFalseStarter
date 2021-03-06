//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var questionsPerRound = 4                                                       ///stored value properties
    var questionsAsked = 0
    var correctQuestions = 0
    var indexOfSelectedQuestion: Int = 0
    var askedDataArray: [Int] = []
    var gameSound: SystemSoundID = 0

    
    
    @IBOutlet weak var questionField: UILabel!                                      ///connections with Interface Builder
    @IBOutlet weak var trueFalseField: UILabel!
    @IBOutlet weak var answer1: UIButton!
    @IBOutlet weak var answer2: UIButton!
    @IBOutlet weak var answer3: UIButton!
    @IBOutlet weak var answer4: UIButton!
    @IBOutlet weak var navigateButton: UIButton!
    
    
    override func viewDidLoad() {                                                   ///calling functions to set-up View
        super.viewDidLoad()
        
        loadStartGameSound()
                                                                                    //starting game
        playStartGameSound()
        displayQuestionAndAnswers()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func displayQuestionAndAnswers() {                                               ///displaying question&answers

        
        indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
        
        while askedDataArray.contains(indexOfSelectedQuestion) {                      //ensuring question randomness
            
            indexOfSelectedQuestion = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count)
            
        }
        
        askedDataArray.append(indexOfSelectedQuestion)
        
        let questionAndAnswers = trivia[indexOfSelectedQuestion]
        questionField.text =  questionAndAnswers.question
        
                                                                                        //setting button titles
        answer1.setTitle("\(questionAndAnswers.answer1)", for: .normal)
        answer2.setTitle("\(questionAndAnswers.answer2)", for: .normal)
        answer3.setTitle("\(questionAndAnswers.answer3)", for: .normal)
        answer4.setTitle("\(questionAndAnswers.answer4)", for: .normal)
                                                                                        //hidding two button/answers
        if "\(questionAndAnswers.answer1)" == "Yes" || "\(questionAndAnswers.answer2)" == "No" {
            
            answer3.isHidden = true
            answer4.isHidden = true
            
        }else{
            
            answer3.isHidden = false
            answer4.isHidden = false
        
        }
        
        trueFalseField.isHidden = true
        navigateButton.isHidden = true
        answer1.tintColor = UIColor.white                                            //setting defaulf button.tint color
        answer2.tintColor = UIColor.white
        answer3.tintColor = UIColor.white
        answer4.tintColor = UIColor.white
    }
    
    
   @IBAction func checkAnswer(_ sender: UIButton) {                                  ///setting correct&incorrect answers
    
        questionsAsked += 1
    
        trueFalseField.isHidden = false
                                                                                      //storing each button title/answer
        let selectedQuestions = trivia[indexOfSelectedQuestion]
        let someAnswer1 = selectedQuestions.answer1
        let someAnswer2 = selectedQuestions.answer2
        let someAnswer3 = selectedQuestions.answer3
        let someAnswer4 = selectedQuestions.answer4
        
        let correctAnswer = selectedQuestions.correctAnswer
                                                                                      //checking answers
        
        if ((sender === answer1  && someAnswer1 == correctAnswer) || (sender === answer2  && someAnswer2 == correctAnswer)) || ((sender === answer3  && someAnswer3 == correctAnswer) || (sender === answer4  && someAnswer4 == correctAnswer)) {
        
            correctQuestions += 1
            navigateButton.isHidden = false
            trueFalseField.text = "Correct answer!!"
            
        } else {
            
            switch correctAnswer{                                                    //displaying correct answer,when User hit wrong
            case someAnswer1:
                answer1.tintColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
                answer2.tintColor = UIColor.lightText
                answer3.tintColor = UIColor.lightText
                answer4.tintColor = UIColor.lightText
            case someAnswer2:
                answer1.tintColor = UIColor.lightText
                answer2.tintColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
                answer3.tintColor = UIColor.lightText
                answer4.tintColor = UIColor.lightText
            case someAnswer3:
                answer1.tintColor = UIColor.lightText
                answer2.tintColor = UIColor.lightText
                answer3.tintColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
                answer4.tintColor = UIColor.lightText
                
            case someAnswer4:
                answer1.tintColor = UIColor.lightText
                answer2.tintColor = UIColor.lightText
                answer3.tintColor = UIColor.lightText
                answer4.tintColor = UIColor(red: 223/255.0, green: 86/255.0, blue: 94/255.0, alpha: 1.0)
                
            default:
                print("")
            }
            
            trueFalseField.text = "Sorry,keep forward..."
            navigateButton.isHidden = false
            
        }

    if questionsAsked == questionsPerRound {
        
        loadScorePage(seconds: 2)
        navigateButton.isHidden = true
    }
  }
    
    
    @IBAction func settingNavigateButton() {                                              ///setting Navigate Button
        
            displayQuestionAndAnswers()
            navigateButton.setTitle("Next Question", for: .normal)
            answer1.isHidden = false
            answer2.isHidden = false
    }
    
    
    func displayScore() {                                                                 ///score page set-up
        
        questionField.text = "Way to go!You scored \(correctQuestions) of \(questionsPerRound) correct!"
        
        questionsAsked = 0
        correctQuestions = 0
        
        answer1.isHidden = true
        answer2.isHidden = true
        answer3.isHidden = true
        answer4.isHidden = true
        trueFalseField.isHidden = true
        navigateButton.isHidden = false
        
        navigateButton.setTitle("Play Again", for: .normal)
        
    }
                                                                                           /// MARK: Helper Methods
    
    func loadScorePage(seconds: Int) {                           // converts a delay in seconds to nanoseconds as signed 64 bit integer

        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
                                                            // calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
                                                                                            //display score page
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
        
            self.displayScore()
    }
        
}
                                                                                             ///load game start sound
    func loadStartGameSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }

    func playStartGameSound() {
        AudioServicesPlaySystemSound(gameSound)
    }


}



