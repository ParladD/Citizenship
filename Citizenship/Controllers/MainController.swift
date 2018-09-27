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
    

    var questions = [Result]()
    
    
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
        performSegue(withIdentifier: "segueToTest", sender: self)
        
    }
    
    
    //MARK:- Helper Functions
    
    override func setUpView() {
        practiceButton.setRadius(of: 8)
        testButton.setRadius(of: 8)
        longQuestionButton.setRadius(of: 8)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueToPractice"{
            let practiceController = segue.destination as? PracticeController
            practiceController?.NavigationTitle = practiceButton.currentTitle!
    
        }else if segue.identifier == "segueToTest"{
            let testController = segue.destination as? TestController
            testController?.NavigationTitle = "Test Questions"
        }
        
    }

}

