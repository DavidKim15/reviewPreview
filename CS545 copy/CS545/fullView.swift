//
//  fullView
//  reviewPreview
//
//  Created by David Kim on 2/22/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit
import SQLite

class fullView: UIViewController {
    let db = try! Connection("path/to/db.sqlite3")
    
    let sessions = Table("sessions")
    
    let occasion = Expression<String>("occasion")
    let date = Expression<String>("date")
    let courseName = Expression<String>("courseName")
    let addressOfSession = Expression<String>("addressOfSession")
    
    var occasionReceived = ""
    var dateReceived:[String:Int] = [:]
    var courseNameReceived = ""
    var address = "";
    
    var received1 = ""
    var received2:[String:Int] = [:]
    var received3 = ""
    var received4 = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        occasionReceived = received1
        dateReceived = received2
        courseNameReceived = received3
        address = received4
        
        print(occasionReceived)
        print(dateReceived)
        print(courseNameReceived)
        print(address)
    }
    
    
}
