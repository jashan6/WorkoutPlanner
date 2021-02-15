//
//  SuggestionViewController.swift
//  Goals
//
//  Created by Alan Le on 10/23/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class SuggestionViewController: UIViewController {

    @IBOutlet weak var submitButton: UIButton!
    
    @IBOutlet weak var calorieText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(mainInstance.desiredPlan == 0){
            calorieText.text = mainInstance.message
        }
        else if(mainInstance.desiredPlan == 1){
            mainInstance.calorie += 300
            calorieText.text = String(Int(mainInstance.calorie) + 300) + " Calories"
        } else if(mainInstance.desiredPlan == 2){
            mainInstance.calorie += 500
            calorieText.text = String(Int(mainInstance.calorie) + 500) + " Calories"
        } else {
            mainInstance.calorie -= 300
            calorieText.text = String(Int(mainInstance.calorie) - 300) + " Calories"
        }
        
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func setUpElements(){Utilities.styleFilledButton(submitButton)
    }
    

}
