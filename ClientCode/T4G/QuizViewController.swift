//
//  QuizViewController.swift
//  Goals
//
//  Created by Alan Le on 10/20/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var diet = false
    var workout = false
    
    var pickerData1: [String] = [String]()

    var pickerData2: [String] = [String]()
    
    var pickerData3: [String] = [String]()
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var pickerView2: UIPickerView!
    
    @IBOutlet weak var pickerView3: UIPickerView!

    @IBOutlet weak var nextPageButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(nextPageButton)
        
        self.pickerView1.delegate = self
        self.pickerView1.dataSource = self
        
        self.pickerView2.delegate = self
        self.pickerView2.dataSource = self
        
        self.pickerView3.delegate = self
        self.pickerView3.dataSource = self
        
        pickerView1.tag = 1
        pickerView2.tag = 2
        pickerView3.tag = 3
        
        pickerData1 = ["---", "Yes", "No"] //The choices for if the user wants to factor in a diet or not
        pickerData2 = ["---", "Yes", "No"] //The choices for if the user wants to factor in workouts or not
        pickerData3 = ["---", "Lean Weight Gain", "Body Mass Increase", "Body Fat Loss"] //What the user wants to gain from using the application
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 1 {
            return pickerData1.count
        } else if pickerView.tag == 2 {
            return pickerData2.count
        } else {
            return pickerData3.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 1 {
            print(pickerData1)
            return pickerData1[row]
        } else if pickerView.tag == 2 {
            return pickerData2[row]
        } else {
            return pickerData3[row]
        }
    }

    @IBAction func nextPageTapped(_ sender: Any) {
        var first = pickerView1.selectedRow(inComponent: 0)
        var second = pickerView2.selectedRow(inComponent: 0)
        var third = pickerView3.selectedRow(inComponent: 0)
        
        print(first)
        
        mainInstance.desiredPlan = third
        
        if(first == 1 && second == 1){ //The user wants both a diet and workout
            // display text saying "Don't have a plan for you sorry. Not sorry."
            diet = true
            workout = true
        } else if(first == 2 && second == 1){ //The user doesn't want to diet, but does want to workout
            diet = false
            workout = true
        } else if(first == 1 && second == 2){ //The user wants to diet, but not to workout
            diet = true
            workout = false
        } else {
            mainInstance.desiredPlan = 0
            mainInstance.message = "We don't have plan currently."
        }
        
    
        
        print("diet",diet)
        print("workout",workout)
    
        
    
        
        
        
    }

    
    
}
