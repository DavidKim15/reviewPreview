//
//  SessionsForCourse.swift
//  CS545
//
//  Created by David Kim on 4/25/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class SessionsForCourse: UITableViewController {
    
    var selectedCourse:String = ""
    var sessionsForCourse:[(Session,Int64)] = [(Session,Int64)]()
    var selected : (Session,Int64) = (Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "", dateObjOccasion: Date(), dateObjSession : Date()), -1)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SessionCell.self, forCellReuseIdentifier: "cellIdentifier2")
        self.title = "Review Sessions For \(selectedCourse)"
        loadSessionsForSelected()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func loadSessionsForSelected() {
        sessionsForCourse = dbWrapper.instance.getSessionsByCourseName(cn: selectedCourse)
        sessionsForCourse = sessionsForCourse.sorted (by: { (arg0, arg1) -> Bool in
            
            let (fSession, _) = arg1
            let (sSession, _) = arg0
            
            return fSession.courseName < sSession.courseName
        })
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        selected = sessionsForCourse[indexPath.row]
        
        self.performSegue(withIdentifier: "showSessionSelected2", sender: self)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier2", for: indexPath) as! SessionCell
        let currentLastItem = sessionsForCourse[indexPath.row].0
        cell.session = currentLastItem
        
        return cell
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return sessionsForCourse.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Choose your custom row height
        return 100.0;
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("From tableview")
        print(self.navigationController?.viewControllers)
        if segue.identifier == "showSessionSelected2" {
            let SessionView = segue.destination as! SessionView
            SessionView.selectedSession = selected
        }
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
