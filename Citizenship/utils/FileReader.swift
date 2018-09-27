//
//  FileReader.swift
//  Citizenship
//
//  Created by Parlad Dhungana on 2018-09-12.
//  Copyright © 2018 Parlad Dhungana. All rights reserved.
//

import Foundation


class FileReader {

    static let shared = FileReader()
    
    func readFile(filePath: String) -> Data {

        var data: Data = Data()
        
        if let fileName = Bundle.main.path(forResource: filePath, ofType: "json"){
            let url = URL(fileURLWithPath: fileName)
            do{
                 data = try Data(contentsOf: url)
            }
            catch let error as NSError {
                print("error occurred: ", error)
            }

        }
    
        return data
     }
    
    
}





struct Questions: Codable {
    var practice_one: [Result]
    var practice_two: [Result]
    var practice_three:[Result]
    var practice_four: [Result]
  
}


struct Result: Codable{
    let question: String
    let options: [String]
    let answer: String
    
}

struct longQuestions: Codable{
    let question: String
    let answer: String
    
}
