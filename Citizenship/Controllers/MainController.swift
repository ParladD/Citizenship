//
//  ViewController.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-10.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import UIKit

class MainController: ParentController {
    
    //MARK:- IBOulets and properties
    
    let practiceQuestions = "practiceQuestions"
    var practiceQuestionData: Data {
        return FileReader.shared.readFile(filePath: practiceQuestions)
    }
    var questions: Questions?
    var testQuestions = [Result]()
    
    
    @IBOutlet weak var practiceButton: UIButton!
    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var longQuestionButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        
    }
    
    
    //MARK:- IBOulets Actions
    
    @IBAction func practiceButtonPressed(_ sender: Any) {
      
    }
    
    
    @IBAction func testButtonPressed(_ sender: Any) {
     
        testQuestions.removeAll()
        if let question = questions {
            let practiceFour = question.practice_four.shuffled()
            let practiceThree = question.practice_three.shuffled()
            let practiceTwo = question.practice_two.shuffled()
            let practiceOne = question.practice_one.shuffled()
            
            for x in 0...4{
                
                self.testQuestions.append(practiceFour[x])
                self.testQuestions.append(practiceThree[x])
                self.testQuestions.append(practiceTwo[x])
                self.testQuestions.append(practiceOne[x])
            }
        }
        performSegue(withIdentifier: "segueToTest", sender: self)
    }
    
    
    //MARK:- Helper Functions
    
    override func setUpView() {
        practiceButton.setRadius(of: 8)
        testButton.setRadius(of: 8)
        longQuestionButton.setRadius(of: 8)
        
        do{
            questions = try JSONDecoder().decode(Questions.self, from: practiceQuestionData)
            
        }catch let error as NSError {
            print(error)
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToPractice"{
            let practiceController = segue.destination as? PracticeController
            practiceController?.NavigationTitle = practiceButton.currentTitle!
    
        }else if segue.identifier == "segueToTest"{
            let testController = segue.destination as? TestController
            testController?.NavigationTitle = "Test Questions"
            testController?.questions = testQuestions
          
        }
        
    }

}

