//
//  CalorieViewController.swift
//  Goals
//
//  Created by Alan Le on 10/20/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class CalorieViewController: UIViewController {

    @IBOutlet weak var CalorieText: UILabel!
    
    @IBOutlet weak var CalorieHeader: UILabel!
    
    @IBOutlet weak var CalorieItemList: UILabel!
    
    @IBOutlet weak var ItemName: UITextField!
   
    @IBOutlet weak var DateLabel: UILabel!
    
    @IBOutlet weak var ItemCalorie: UITextField!
    
    @IBOutlet weak var ProgressBar: UIProgressView!
    
    @IBOutlet weak var CalorieField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter : DateFormatter = DateFormatter()
        formatter.dateFormat = "M/d/yy"
        let myStr : String = formatter.string(from:   Date.init(timeIntervalSinceNow: 0) as Date)
        
        DateLabel.text = myStr
        
        CalorieHeader.text = String(Int(mainInstance.calorieIntake)) + "/" + String(Int(mainInstance.calorie)) + " Calories"
        ProgressBar.progress = Float(mainInstance.calorieIntake / mainInstance.calorie)
        CalorieItemList.text = ""
        // Do any additional setup after loading the view.
    }
    

    @IBAction func enterTapped(_ sender: Any) {
        mainInstance.calorie = Double(CalorieField.text!)!
        
        update()
    }
    
    @IBAction func addFood(_ sender: Any) {
        mainInstance.calorieIntake += Double(ItemCalorie.text!)!
        var part1:String = "+ " + ItemName.text!
        var part2:String = " " + ItemCalorie.text! + "\n"
        CalorieItemList.text! += (part1 + part2)
        update()
    }
    
    func update() {
        CalorieHeader.text = String(Int(mainInstance.calorieIntake)) + "/" + String(Int(mainInstance.calorie)) + " Calories"
        ProgressBar.progress = Float(mainInstance.calorieIntake / mainInstance.calorie)
    }
}
