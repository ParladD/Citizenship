//
//  PracticeController.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-12.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import UIKit

class PracticeController: ParentController{
    
    //MARK:- IBOutlets and properties
    let backgroundColors: [UIColor] = [
        UIColor.blue,
        UIColor.purple,
        UIColor.orange,
        UIColor.red
    ]
    let  sectionArray = ["Practice Questions 1","Practice Questions 2","Practice Questions 3","Practice Questions 4"]
    
    var buttonTitle: String = ""

    @IBOutlet weak var b1: UIButton!
    @IBOutlet weak var b2: UIButton!
    @IBOutlet weak var b3: UIButton!
    @IBOutlet weak var b4: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    
    
    //MARK:- IBOutlets actions
    
    @IBAction func practiceButtonPressed(_ sender: UIButton) {
        
        buttonTitle =   sectionArray[sender.tag]
        performSegue(withIdentifier: "dynamicController", sender: self)
    }
    
    
    //MARK:- Helpers functions and methods
    override func setUpView() {
        super.setUpView()
        
        let buttons = [b1,b2,b3,b4]
        print(buttons.count)
        for x in 0...buttons.count-1{
            buttons[x]?.optionsButton(text: sectionArray[x], bgColor: backgroundColors[x], size: 20)
            buttons[x]?.tag = x
            
        }
      
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "dynamicController"{
            let controller = segue.destination as? DynamicController
            controller?.NavigationTitle = buttonTitle
        }
        
    }
    
   
}
