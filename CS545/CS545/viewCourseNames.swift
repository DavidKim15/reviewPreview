//
//  ViewCourseNames.swift
//  CS545
//
//  Created by David Kim on 4/24/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

class ViewCourseNames: UITableViewController {
    
    var courseNamesLoaded: [String] = [String]()
    var courseNameSelected:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        tableView.register(SubtitleTableViewCell.self, forCellReuseIdentifier: "DefaultCell")
        self.title = "Available Courses"
        loadCourseNames()
        
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
        return courseNamesLoaded.count
    }
    func loadCourseNames() {
        courseNamesLoaded = dbWrapper.instance.getCourseNames()
        courseNamesLoaded = courseNamesLoaded.sorted()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DefaultCell", for: indexPath)
        
        
        let courseName:String = courseNamesLoaded[indexPath.row]
        let coursesUnderName:[(Session,Int64)] = dbWrapper.instance.getSessionsByCourseName(cn: courseName)
        let count:String = String(coursesUnderName.count)
        
        // Configure the cell...
        cell.textLabel?.text = "\(courseName)"
        cell.detailTextLabel?.text =  "Number of Sessions: \(count)"
        cell.textLabel?.textColor = UIColor(rgb: 0xAE2A2A)
        cell.detailTextLabel?.textColor = .gray

        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //Choose your custom row height
        return 75.0;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected cell number: \(indexPath.row)!")
        courseNameSelected = courseNamesLoaded[indexPath.row]
        
        self.performSegue(withIdentifier: "showCourseSelected", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showCourseSelected" {
            let SessionsForCourse = segue.destination as! SessionsForCourse
            SessionsForCourse.selectedCourse = courseNameSelected
        }
    }

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
class SubtitleTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
