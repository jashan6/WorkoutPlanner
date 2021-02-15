//
//  WorkoutViewController.swift
//  Goals
//
//  Created by Alan Le on 10/23/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class WorkoutLogViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    
    @IBOutlet weak var setsComplete: UITextField!
    @IBOutlet weak var repsComplete: UITextField!
    @IBOutlet weak var textField: UILabel!
    
    @IBOutlet weak var addButton: UIButton!
    

    @IBOutlet weak var pickerView1: UIPickerView!
    @IBOutlet weak var WorkedHours: UITextField!
    
    var pickerData1: [String] = [String]() //The names of the workouts
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func setUpElements(){
        Utilities.styleFilledButton(addButton)
        
        self.pickerView1.delegate = self
        self.pickerView1.dataSource = self
        
        pickerView1.tag = 1
        pickerData1 = mainInstance.workouts
    }
    
    
    //Adds the workout to the workout log
    @IBAction func addTapped(_ sender: Any) {
        var first = pickerView1.selectedRow(inComponent: 0)
        
        var part1:String = pickerData1[first] + " " + setsComplete.text! + " Sets"
        var part2:String = " " + repsComplete.text! + " Reps\n"
        
        textField.text! +=  part1 + part2
    }
    
    //Calculates the calories lost from the workout and subtracts from the calorie intake
    @IBAction func submitTapped(_ sender: Any) {
        
        mainInstance.calorieIntake -= ((Double(WorkedHours.text!)! * 200))
    }
    
       func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    
           return pickerData1.count
       }
       
       func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
           
           return pickerData1[row]
           
       }

}
