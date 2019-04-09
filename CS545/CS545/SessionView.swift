//
//  SessionView.swift
//  CS545
//
//  Created by David Kim on 4/8/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class SessionView: UIViewController {
    
    var selectedSession : Session = Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "")
//    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(selectedSession)
    }
    
}
