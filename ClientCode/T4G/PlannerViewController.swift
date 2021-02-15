//
//  PlannerViewController.swift
//  Goals
//
//  Created by Alan Le on 10/23/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class PlannerViewController: UIViewController {

    @IBOutlet weak var HeaderText: UILabel!
    @IBOutlet weak var ItemCalorie: UITextField!
    @IBOutlet weak var ItemName: UITextField!
    @IBOutlet weak var CalorieItemList: UILabel!
    @IBOutlet weak var ProgressBar: UIProgressView!
    @IBOutlet weak var CalorieHeader: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Change the header based on what plan the user wanted
        if(mainInstance.desiredPlan == 1){
            HeaderText.text = "Lean Weight Gain"
        } else if(mainInstance.desiredPlan == 2){
            HeaderText.text = "Body Mass Increase"
        } else {
            HeaderText.text = "Body Fat Loss"
        }
        
        //Display the date
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        let myStr : String = formatter.string(from:   Date.init(timeIntervalSinceNow: 0) as Date)
        
        DateLabel.text = myStr
        
        //Display calorie information and progress
        CalorieHeader.text = String(Int(mainInstance.calorieIntake)) + "/" + String(Int(mainInstance.calorie)) + " Calories"
        ProgressBar.progress = Float(mainInstance.calorieIntake / mainInstance.calorie)
        CalorieItemList.text = ""
    }
    
    //Adds a food item to the log and its calorie contents to the calorie intake
    @IBAction func addFood(_ sender: Any) {
        mainInstance.calorieIntake += Double(ItemCalorie.text!)!
        var part1:String = "+ " + ItemName.text!
        var part2:String = " " + ItemCalorie.text! + "\n"
        CalorieItemList.text! += (part1 + part2)
        update()
    }
    
    //Called when the view needs to be updated
    func update() {
        CalorieHeader.text = String(Int(mainInstance.calorieIntake)) + "/" + String(Int(mainInstance.calorie)) + " Calories"
        ProgressBar.progress = Float(mainInstance.calorieIntake / mainInstance.calorie)
    }
}
