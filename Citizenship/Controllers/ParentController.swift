//
//  ParentController.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-11.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import UIKit

class ParentController: UIViewController{
    
    var NavigationTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    //MARK:- Helper functions
    
    func setUpView(){
        navigationItem.title = NavigationTitle
    }
    
}

