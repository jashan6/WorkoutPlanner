//
//  QuizViewController.swift
//  Goals
//
//  Created by Alan Le on 10/20/19.
//  Copyright © 2019 Alan Le. All rights reserved.
//

import UIKit

class QuizPart2ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource  {
    
    var calorie = 1.0
    
    var pickerData1: [String] = [String]()

    var pickerData2: [[[String]]] = [[[String]]]()
    
    var pickerData3: [String] = [String]()
    
    @IBOutlet weak var pickerView1: UIPickerView!
    
    @IBOutlet weak var ageInput: UITextField!
    
    @IBOutlet weak var heightInput: UITextField!
    
    @IBOutlet weak var weightInput: UITextField!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setUpElements(){
        
        Utilities.styleFilledButton(submitButton)
        
        self.pickerView1.delegate = self
        self.pickerView1.dataSource = self
        
        
        
        pickerView1.tag = 1
        
        
        pickerData1 = ["---", "Male", "Female"]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
 
        return pickerData1.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String {
        
        return pickerData1[row]
        
    }

    
    @IBAction func submitTapped(_ sender: Any) {
        
        var first = pickerView1.selectedRow(inComponent: 0)
        
        let age = Double(ageInput.text!)!
        let height = Double(heightInput.text!)!
        let weight = Double(weightInput.text!)!

        
        

        if(first == 1){ //The user is male
            let malePart1 = 6.3 * weight
            let malePart2 = (12.9 * height)
            let malePart3 = -(6.8 * age)
            mainInstance.calorie = ((66 + malePart1 + malePart2 + malePart3) * 1.2)
        } else if(first == 2){ //The user is female
            let malePart1 = 4.3 * weight
            let malePart2 = (4.7 * height)
            let malePart3 = -(4.7 * age)
            mainInstance.calorie = ((66.5 + malePart1 + malePart2 + malePart3) * 1.375)
        }
    }
    
    func getCalorie() -> Double {
        return calorie
    }
    

    
}

