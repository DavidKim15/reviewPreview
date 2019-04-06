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
    
    var pickerData: [String] = [String]()
    var occasionDate: String = ""
    var reviewSessionDate: [String:Int] = [:]
    var occasion: String = ""
    
    // send data over to fullView
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {// get a reference to the second view controller
        let org2 = segue.destination as! organizerView2
        // set a variable in the second view controller with the String to pass
        org2.received1 = occasion
        org2.received2 = reviewSessionDate
        org2.received3 = courseName.text!
        
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
            occasionDate = ("\(month) \(day) \(year)")
            print(occasionDate)
        }
    }
    @objc func dateChanged2(_ sender: UIDatePicker) {
//        let format = DateFormatter()
//        format.dateFormat = "EEEE, MMMM dd HH"
        let components = Calendar.current.dateComponents([.day,.month,.weekday,.hour,.minute,], from: sender.date)
        print(components)
        if let day = components.day, let month = components.month, let weekday = components.weekday, let hour = components.hour, let minute = components.minute {
            reviewSessionDate = ["Weekday" : weekday, "Month": month, "Day": day, "Hour" : hour, "Minute" : minute]
            print(reviewSessionDate)
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
    
}

