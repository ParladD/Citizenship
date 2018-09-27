//
//  ParentController.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-11.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import UIKit

class ParentController: UIViewController{
    
    //Properties
    var NavigationTitle: String?
    let practiceQuestions = "practiceQuestions"
    
    var dispatchTime : DispatchTime {
        return  DispatchTime.now() + 1
    }
    
    var practiceQuestionData: Data {
        return FileReader.shared.readFile(filePath: practiceQuestions)
    }
    
    var totQuestion: Questions?
    var testQuestions = [Result]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    //MARK:- Helper functions
    
    func setUpView(){
        navigationItem.title = NavigationTitle
        do{
            totQuestion = try JSONDecoder().decode(Questions.self, from: practiceQuestionData)
        }catch {
            ProgressHUD.showError("Opps something went wrong.")
        }
    }
    
    func createQuestions() -> [Result]{
        testQuestions.removeAll()
        
        if let question = totQuestion {
            let practiceFour = question.practice_four.shuffled()
            let practiceThree = question.practice_three.shuffled()
            let practiceTwo = question.practice_two.shuffled()
            let practiceOne = question.practice_one.shuffled()
            
            for x in 0...4{
                testQuestions.append(practiceFour[x])
                testQuestions.append(practiceThree[x])
                testQuestions.append(practiceTwo[x])
                testQuestions.append(practiceOne[x])
            }
        }
        return testQuestions
    }
    
}

