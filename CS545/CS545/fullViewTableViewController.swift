//
//  fullViewTableViewController.swift
//  CS545
//
//  Created by David Kim on 4/6/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class fullViewTableViewController: UITableViewController {
    var occasionReceived = ""
    var dateReceived = ""
    var courseNameReceived = ""
    var address = "";
    var organizerName = "";
    var occasionDate = "";
    
    var receivedOccasion = ""
    var receivedSessionDate = ""
    var receivedCourseName = ""
    var received4 = ""
    var receivedOrganizerName = ""
    var receivedOccasionDate = ""
    
    var sessions : [Session] = [Session]()
    
//    ----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SessionCell.self, forCellReuseIdentifier: "cellIdentifier")

        self.title = "Review Sessions"
        
        occasionReceived = receivedOccasion
        dateReceived = receivedSessionDate
        courseNameReceived = receivedCourseName
        address = received4
        organizerName = receivedOrganizerName
        occasionDate = receivedOccasionDate
        
        createSessionArray()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sessions.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! SessionCell
        let currentLastItem = sessions[indexPath.row]
        cell.session = currentLastItem
        
        return cell
    }
    func createSessionArray() {
        
        print(occasionReceived)
        print(dateReceived)
        print(courseNameReceived)
        print(address)
        print(organizerName)
        print(receivedOccasionDate)
//        occasionReceived = "Exam"
//        dateReceived = "Monday 4:00PM 4/9"
//        courseNameReceived = "CS 115"
//        address = "NC 120"
//        organizerName = "Khayyam"
//        receivedOccasionDate = "4/20/2019"
        if !(occasionReceived == "") {
            let rowid = dbWrapper.instance.addSession(sdate: dateReceived, occ: occasionReceived, odate: receivedOccasionDate, cname: courseNameReceived, address: address, oname: organizerName)
            print(rowid)
        }
        
        sessions = dbWrapper.instance.getSessions()
        
//        sessions.append(Session(courseName: "CS 115",sessionDate: "01 01 2019",occasionDate: "01 03 2019", addressOfSession: "BC 120",occasion: "Exam", organizer: "Ham"))
//        sessions.append(Session(courseName: "CS 334",sessionDate: "03 14 2019",occasionDate: "03 15 2019", addressOfSession: "Lambda House",occasion: "Midterm", organizer: "Bobby"))
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 75.0;//Choose your custom row height
    }
    
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
////        if cell == nil
////        {
////            cell = UITableViewCell(style: .value2 , reuseIdentifier: "cellIdentifier")
////        }
//
//        cell!.textLabel?.text = sessions[indexPath.row][0]
//        cell!.textLabel?.textAlignment = .left
//        cell!.detailTextLabel?.text = sessions[indexPath.row][2] + " " + sessions[indexPath.row][1] + " " + sessions[indexPath.row][3]
//
//        return cell!
//    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
