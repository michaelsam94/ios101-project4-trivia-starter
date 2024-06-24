//
//  TriviaQuestion.swift
//  Trivia
//
//  Created by Mari Batilando on 4/6/23.
//

import Foundation

//{
//"response_code": 0,
//"results": [
//    {
//        "type": "multiple",
//        "difficulty": "hard",
//        "category": "Entertainment: Japanese Anime &amp; Manga",
//        "question": "Which of the following countries does &quot;JoJo&#039;s Bizarre Adventure: Stardust Crusaders&quot; not take place in?",
//        "correct_answer": "Philippines",
//        "incorrect_answers": [
//            "India",
//            "Pakistan",
//            "Egypt"
//        ]
//    },
//    ]
// }

struct TriviaQuestion: Decodable {
    let type: String
    let difficulty: String
    let category: String
    let question: String
    let correctAnswer: String
    let incorrectAnswers: [String]

    private enum CodingKeys: String, CodingKey {
        case type
        case difficulty
        case category
        case question
        case correctAnswer = "correct_answer"
        case incorrectAnswers = "incorrect_answers"
    }
}

struct TriviaApiResponse: Decodable {
    let responseCode: Int
    let results: [TriviaQuestion]

    private enum CodingKeys: String, CodingKey {
        case responseCode = "response_code"
        case results
    }
}
