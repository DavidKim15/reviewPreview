//
//  organizerView.swift
//  reviewPreview
//
//  Created by David Kim on 2/22/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class organizerView: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    @IBOutlet weak var pickOccasion: UIPickerView!
    
    @IBOutlet weak var occasionText: UILabel!
    @IBOutlet weak var datePicker = UIDatePicker()
    @IBOutlet weak var courseName: UITextField!
    @IBOutlet weak var reviewSessionDatePicker: UIDatePicker!
    //@IBOutlet weak var pickLocation: UIPickerView!
    @IBOutlet weak var organizerName: UITextField!
    @IBOutlet weak var userInputLocation: UITextField!
    
    var pickerData: [String] = [String]()
    var occasionDate: String = ""
    var reviewSessionDate: String = ""
    var occasion: String = ""
    var reviewSessionDict: [String:Int] = [:]
    
    let mapWeekday : [Int:String] = [
        1: "Sunday",
        2: "Monday",
        3: "Tuesday",
        4: "Wednesday",
        5: "Thursday",
        6: "Friday",
        7: "Saturday"]
    let mapMilitaryTime : [Int:Int] = [
        0:12,
        1:1,
        2:2,
        3:3,
        4:4,
        5:5,
        6:6,
        7:7,
        8:8,
        9:9,
        10:10,
        11:11,
        12:12,
        13:1,
        14:2,
        15:3,
        16:4,
        17:5,
        18:6,
        19:7,
        20:8,
        21:9,
        22:10,
        23:11
    ]
    
    // send data over to fullView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// get a reference to the second view controller
        let fullViewTableViewController = segue.destination as! fullViewTableViewController
        // set a variable in the second view controller with the String to pass
        formatReviewDate()
        fullViewTableViewController.receivedOccasion = occasion
        fullViewTableViewController.receivedSessionDate = reviewSessionDate
        fullViewTableViewController.receivedCourseName = courseName.text!
        fullViewTableViewController.receivedOrganizerName = organizerName.text!
        fullViewTableViewController.receivedOccasionDate = occasionDate
        fullViewTableViewController.receivedAddress = userInputLocation.text!
        
//        fullView.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.pickOccasion.delegate = self
        self.pickOccasion.dataSource = self
        pickerData = ["Midterm", "Final", "Exam"]
        
        datePicker?.datePickerMode = UIDatePicker.Mode.date
        datePicker?.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        reviewSessionDatePicker.addTarget(self, action: #selector(dateChanged2(_:)), for: .valueChanged)
    }
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            occasionDate = ("\(month)/\(day)/\(year)")
            print(occasionDate)
        }
    }
    @objc func dateChanged2(_ sender: UIDatePicker) {
//        let format = DateFormatter()
//        format.dateFormat = "EEEE, MMMM dd HH"
        let components = Calendar.current.dateComponents([.day,.month,.weekday,.hour,.minute,], from: sender.date)
        print(components)
        if let day = components.day, let month = components.month, let weekday = components.weekday, let hour = components.hour, let minute = components.minute {
            reviewSessionDict = ["Weekday" : weekday, "Month": month, "Day": day, "Hour" : hour, "Minute" : minute]
            print(reviewSessionDict)
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        occasion = pickerData[row]
        occasionText.text = "When is this " + pickerData[row] + "?"
        return pickerData[row]
    }
    func formatReviewDate() {
        reviewSessionDate += mapWeekday[reviewSessionDict["Weekday"]!]! + ", "
        reviewSessionDate += String(mapMilitaryTime[reviewSessionDict["Hour"]!]!) + ":"
        if (reviewSessionDict["Minute"]! < 10) {
            reviewSessionDate += "0" + String(reviewSessionDict["Minute"]!)
        }
        else {
            reviewSessionDate += String(reviewSessionDict["Minute"]!)
        }
        if (reviewSessionDict["Hour"]! < 13) {
            reviewSessionDate += "AM"
        }
        else {
            reviewSessionDate += "PM"
        }
        reviewSessionDate += " "
        reviewSessionDate += String(reviewSessionDict["Month"]!) + "/"
        reviewSessionDate += String(reviewSessionDict["Day"]!)
    }
    @objc func comeBackhere(sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SessionView = storyBoard.instantiateViewController(withIdentifier: "SessionView") as! SessionView
        self.present(SessionView, animated: true, completion: nil)
    }
}

