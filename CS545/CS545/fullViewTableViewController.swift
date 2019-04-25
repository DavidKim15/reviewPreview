//
//  fullViewTableViewController.swift
//  CS545
//
//  Created by David Kim on 4/6/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class fullViewTableViewController: UITableViewController {
   var selected : (Session,Int64) = (Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "", dateObjOccasion: Date(), dateObjSession : Date()), -1)
    
    var occasionReceived = ""
    var dateReceived = ""
    var courseNameReceived = ""
    var address = "";
    var organizerName = "";
    var occasionDate = "";
    
    var receivedOccasion = ""
    var receivedSessionDate = ""
    var receivedCourseName = ""
    var receivedAddress = ""
    var receivedOrganizerName = ""
    var receivedOccasionDate = ""
    var dateObjOccasion:Date?
    var dateObjSession:Date?
    var receivedId : Int64 = -1
    
    var sessions : [(Session,Int64)] = [(Session,Int64)]()
    
    
//    ----------------------------------------------------------------
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SessionCell.self, forCellReuseIdentifier: "cellIdentifier")

        self.title = "Review Sessions"
//        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(rgb: 0xff7f00)]
        
        occasionReceived = receivedOccasion
        dateReceived = receivedSessionDate
        courseNameReceived = receivedCourseName
        address = receivedAddress
        organizerName = receivedOrganizerName
        occasionDate = receivedOccasionDate
        
        createSessionArray()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.loadList), name: Notification.Name("Load"), object: nil)

        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

//    override func viewDidAppear(_ animated: Bool) {
//        super.tableView.reloadData()
//        self.tableView.reloadData()
//    }
    @objc func loadList(){
        createSessionArray()
        tableView.reloadData();
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
        let currentLastItem = sessions[indexPath.row].0
        cell.session = currentLastItem
        
        return cell
    }
    func createSessionArray() {
        /*
        let sess : Session =
            Session(
                courseName      : "CS 115",
                sessionDate     : "Monday 5:08AM 4/8",
                occasionDate    : "5/7/2019",
                addressOfSession: "BC 120",
                occasion        : "Midterm",
                organizer       : "Mijeong")
        dbWrapper.instance.updateSession(sid: 2, newSession: sess)
        */
//        occasionReceived = "Exam"
//        dateReceived = "Monday 4:00PM 4/9"
//        courseNameReceived = "CS 115"
//        address = "NC 120"
//        organizerName = "Khayyam"
//        receivedOccasionDate = "4/20/2019"
        if (receivedId != -1) {
            let rowid = dbWrapper.instance.updateSession(
                sid: receivedId,
                newSession: Session(courseName : courseNameReceived,
                                    sessionDate: dateReceived,
                                    occasionDate: receivedOccasionDate,
                                    addressOfSession: address,
                                    occasion: occasionReceived,
                                    organizer: organizerName,
                                    dateObjOccasion: dateObjOccasion,
                                    dateObjSession: dateObjSession))
            print(rowid)
        }
        else if !(occasionReceived == "") {
            let rowid = dbWrapper.instance.addSession(
                            sdate: dateReceived,
                            occ: occasionReceived,
                            odate: receivedOccasionDate,
                            cname: courseNameReceived,
                            address: address,
                            oname: organizerName,
                            dOO : dateObjOccasion!,
                            dOS : dateObjSession!)
            print(rowid)
        }
        sessions = dbWrapper.instance.getSessions()
        sessions = sessions.sorted (by: { (arg0, arg1) -> Bool in
            
            let (fSession, _) = arg0
            let (sSession, _) = arg1
            
            return fSession.courseName < sSession.courseName
        })
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Choose your custom row height
        return 100.0;
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        selected = sessions[indexPath.row]
        
        self.performSegue(withIdentifier: "showSessionSelected", sender: self)
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("From tableview")
        print(self.navigationController?.viewControllers)
        if segue.identifier == "showSessionSelected" {
            let SessionView = segue.destination as! SessionView
            SessionView.selectedSession = selected
        }
    }
 
    
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier")
        if cell == nil
        {
            cell = UITableViewCell(style: .value2 , reuseIdentifier: "cellIdentifier")
        }

        cell!.textLabel?.text = sessions[indexPath.row][0]
        cell!.textLabel?.textAlignment = .left
        cell!.detailTextLabel?.text = sessions[indexPath.row][2] + " " + sessions[indexPath.row][1] + " " + sessions[indexPath.row][3]

        return cell!
    }
     */

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
 
    
}
