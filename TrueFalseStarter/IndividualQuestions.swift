//
//  IndividualQuestions.swift
//  TrueFalseStarter
//
//  Created by Stipe Vucemilovic on 12/20/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import Foundation
import GameKit



struct IndividualQuestions {
    let trivia: [[String : String]] = [
        ["Question": "Only female koalas can whistle", "Answer": "False"],
        ["Question": "Blue whales are technically whales", "Answer": "True"],
        ["Question": "Camels are cannibalistic", "Answer": "False"],
        ["Question": "All ducks are birds", "Answer": "True"]
    ]



    func getIndividualQuestion() -> [String:String] {
    
    
    let question = GKRandomSource.sharedRandom().nextInt(upperBound: trivia.count )
    
    
    
    return trivia[question]
    }


}
























