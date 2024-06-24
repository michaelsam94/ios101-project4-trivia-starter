//
//  TriviaService.swift
//  Trivia
//
//  Created by Michael on 24/06/2024.
//

import Foundation


class TriviaService {
    
    static func fetchTrivia(withAmount amount: Int,completion: ((TriviaApiResponse) -> Void)? = nil) {
        
        let baseUrl = "https://opentdb.com/api.php"
        let parms = "amount=\(amount)"
        let url = URL(string: "\(baseUrl)?\(parms)")!
        let task = URLSession.shared.dataTask(with: url) { data,response,error in
            guard error == nil else {
                assertionFailure("there is error \(error?.localizedDescription ?? "")")
                return
            }
            guard let httpRespons = response as? HTTPURLResponse else {
                assertionFailure("reponse not valide")
                return
            }
            guard let data = data , httpRespons.statusCode == 200 else {
                assertionFailure("response code is \(httpRespons.statusCode)")
                return
            }
            
            
//            guard let response = parse(data: data) else {
//                assertionFailure("cannot parse the response")
//                return
//            }
            let decoder = JSONDecoder()
            do {
                let response = try decoder.decode(TriviaApiResponse.self, from: data)
                
                DispatchQueue.main.async {
                    completion?(response)
                }
        
            } catch {
                print("error parsing the decodeable response")
            }
            
        }
        task.resume()
      
    }
    
    static func parse(data: Data) -> TriviaApiResponse?  {
        do {
            if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let responseCode = jsonObject["response_code"] as? Int,
               let resultsArray = jsonObject["results"] as? [[String: Any]] {
                
                var questions = [TriviaQuestion]()
                
                for result in resultsArray {
                    if let type = result["type"] as? String,
                       let difficulty = result["difficulty"] as? String,
                       let category = result["category"] as? String,
                       let question = result["question"] as? String,
                       let correctAnswer = result["correct_answer"] as? String,
                       let incorrectAnswers = result["incorrect_answers"] as? [String] {
                        
                        let questionObj = TriviaQuestion(type: type, difficulty: difficulty, category: category, question: question, correctAnswer: correctAnswer, incorrectAnswers: incorrectAnswers)
                        questions.append(questionObj)
                    }
                }
                
                let response = TriviaApiResponse(responseCode: responseCode, results: questions)
                
                // Now `response` is populated with the parsed data
                print(response)
                
                return response
            } else {
                print("Failed to parse JSON")
                return nil
            }
        } catch {
            print("Error parsing JSON: \(error)")
            return nil
        }
    }
}
