//
//  IndividualQuestions.swift
//  TrueFalseStarter
//
//  Created by Stipe Vucemilovic on 12/20/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit



class QuestionData {
    
    let question: String
    let answer1: String
    let answer2: String
    let answer3: String
    let answer4: String
    let correctAnswer: String
  
    
    
    
    init( question: String, answer1: String, answer2: String, answer3: String, answer4: String, correctAnswer: String ) {
        
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correctAnswer = correctAnswer
        
    }
    
}


var trivia = [ QuestionData(question: "Only female koalas can whistle", answer1: "Yes", answer2: "No", answer3: "", answer4: "", correctAnswer: "No"),
    
              QuestionData(question: "Blue whales are technically whales", answer1: "Yes", answer2: "No", answer3: "", answer4: "", correctAnswer: "Yes"),
    
              QuestionData(question:  "Camels are cannibalistic", answer1: "Yes", answer2: "No", answer3: "", answer4: "", correctAnswer: "No"),
    
              QuestionData(question: "All ducks are birds", answer1: "Yes", answer2: "No", answer3: "", answer4: "", correctAnswer: "Yes"),
    
              QuestionData(question: "This was the only US President to serve more than two consecutive terms", answer1: "George Washington", answer2: "Franklin D.Roosevelt", answer3: "Woodrow Wilson", answer4: "Andrew Jackson", correctAnswer: "Franklin D.Roosevelt"),
    
              QuestionData(question: "Which of the following countries has the most residents?", answer1: "Nigeria", answer2: "Russsia", answer3: "Iran", answer4: "Vietnam", correctAnswer: "Nigeria"),
    
              QuestionData(question: "In what year was the United Nations founded?", answer1: "1918", answer2: "1919", answer3:  "1945", answer4: "1954", correctAnswer: "1945"),
    
              QuestionData(question: "The Titanic departed from United Kingdom, where was it supposed to arrive?", answer1: "Paris", answer2: "Washington D.C", answer3: "New York City", answer4: "Boston", correctAnswer: "New York City" ),
    
              QuestionData(question: "Which nation produces the most oil?", answer1: "Iran", answer2: "Iraq", answer3: "Brazil", answer4: "Canada", correctAnswer: "Canada"),
    
              QuestionData(question: "Which country has most recently won consecutive World Cups in Soccer?", answer1: "Italy", answer2: "Brazil", answer3: "Argentina", answer4: "Spain", correctAnswer: "Brazil"),
    
              QuestionData(question: "Which of the following rivers is longest?", answer1: "Yangtze", answer2: "Mississippi", answer3: "Congo", answer4: "Mekong", correctAnswer: "Mississippi"),
    
              QuestionData(question: "Which city is the oldest?", answer1: "Mexico City", answer2: "Cape Town", answer3: "San Juan", answer4: "Sydney", correctAnswer: "Mexico City"),
    
              QuestionData(question: "Which country was the first to allow women to vote in national election?", answer1: "Poland", answer2: "United States", answer3: "Sweden", answer4: "Senegal", correctAnswer: "Poland"),
    
              QuestionData(question: "Which of these countries won most medals in the 2012 Summer Games?", answer1: "France", answer2: "Germany", answer3: "Japan", answer4: "Great Britain", correctAnswer: "Great Britain"),
]

























