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
    
    @IBOutlet weak var occasionText: UILabel?
    @IBOutlet weak var datePicker = UIDatePicker()
    @IBOutlet weak var courseName: UITextField?
    @IBOutlet weak var reviewSessionDatePicker = UIDatePicker()
    //@IBOutlet weak var pickLocation: UIPickerView!
    @IBOutlet weak var organizerName: UITextField?
    @IBOutlet weak var userInputLocation: UITextField?

    var pickerData: [String] = [String]()
    var occasionDate: String = ""
    var reviewSessionDate: String = ""
    var occasion: String = ""
    var reviewSessionDict: [String:Int] = [:]
    var dateObjOccasion : Date?
    var dateObjSession : Date?
    
    var editingSelectedSession : (Session,Int64) = (Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "", dateObjOccasion: Date(), dateObjSession : Date()), -1)
    
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
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //get a reference to the second view controller
        let fullViewTableViewController = segue.destination as! fullViewTableViewController
        //set a variable in the second view controller with the String to pass
        formatReviewDate()
        fullViewTableViewController.receivedOccasion = occasion
        fullViewTableViewController.receivedSessionDate = reviewSessionDate
        fullViewTableViewController.receivedCourseName = courseName?.text ?? "N/A"
        fullViewTableViewController.receivedOrganizerName = organizerName?.text ?? "N/A"
        fullViewTableViewController.receivedOccasionDate = occasionDate
        fullViewTableViewController.receivedAddress = userInputLocation?.text ?? "N/A"
        fullViewTableViewController.dateObjOccasion = dateObjOccasion
        fullViewTableViewController.dateObjSession = dateObjSession
        fullViewTableViewController.receivedId = editingSelectedSession.1
    }
 
//    @IBAction func navigate_validate(_ sender: Any) {
//        if organizerName?.text == "" && courseName?.text == "" {
//            organizerName?.placeholder = "Enter a name!"
//            courseName?.placeholder = "Enter a course name!"
//        }
//        else {
//            let ft = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "fullViewTableViewController") as UIViewController
//            self.navigationController?.pushViewController(ft, animated: true)
//        }
//
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        organizerName?.text             = editingSelectedSession.0.organizer
        courseName?.text                = editingSelectedSession.0.courseName
        userInputLocation?.text         = editingSelectedSession.0.addressOfSession
        occasionText?.text              = editingSelectedSession.0.occasion
        reviewSessionDatePicker?.setDate(editingSelectedSession.0.dateObjSession!, animated: false)
        datePicker?.setDate(editingSelectedSession.0.dateObjOccasion!, animated: false)
        self.title = "Create Review Session"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(moveToRoot))
        // set default date values to now
        initializeDateStuff()
        
        
        self.pickOccasion.delegate = self
        self.pickOccasion.dataSource = self
        pickerData = ["Midterm", "Final", "Exam"]
        
        datePicker?.datePickerMode = UIDatePicker.Mode.date
        datePicker?.addTarget(self, action: #selector(dateChanged(_:)), for: .valueChanged)
        reviewSessionDatePicker?.addTarget(self, action: #selector(dateChanged2(_:)), for: .valueChanged)
    }
    
    @objc func dateChanged(_ sender: UIDatePicker) {
        let components = Calendar.current.dateComponents([.year, .month, .day], from: sender.date)
        if let day = components.day, let month = components.month, let year = components.year {
            occasionDate = ("\(month)/\(day)/\(year)")
            print(occasionDate)
            dateObjOccasion = Calendar.current.date(from: components)
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
            dateObjSession = Calendar.current.date(from : components)
        }
    }
    @objc func moveToRoot() {
        self.navigationController!.popToRootViewController(animated: true)
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
        occasionText?.text = "When is this " + pickerData[row] + "?"
        return pickerData[row]
    }
    func initializeDateStuff() {
        dateObjOccasion = Date()
        dateObjSession = Date()
        
        // take care of session date
        var components = Calendar.current.dateComponents([.day,.month,.weekday,.hour,.minute,], from: dateObjSession!)
        if let day = components.day, let month = components.month, let weekday = components.weekday, let hour = components.hour, let minute = components.minute {
            reviewSessionDict = ["Weekday" : weekday, "Month": month, "Day": day, "Hour" : hour, "Minute" : minute]
        }
        formatReviewDate()
        
        // take care of occasion date
        components = Calendar.current.dateComponents([.year, .month, .day], from: dateObjOccasion!)
        if let day = components.day, let month = components.month, let year = components.year {
            occasionDate = ("\(month)/\(day)/\(year)")
        }
    }
    func formatReviewDate() {
        reviewSessionDate = ""
        reviewSessionDate += String(reviewSessionDict["Month"]!) + "/"
        reviewSessionDate += String(reviewSessionDict["Day"]!)
        reviewSessionDate += " "
        
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

    }
    @objc func comeBackHere(sender: UIBarButtonItem) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let SessionView = storyBoard.instantiateViewController(withIdentifier: "SessionView") as! SessionView
//        SessionView.selectedSession = Session(  courseName = courseName.text!,
//                                                sessionDate = )
        self.present(SessionView, animated: true, completion: nil)
    }
}

