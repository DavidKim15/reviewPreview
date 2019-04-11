//
//  SessionViewHandle.swift
//  CS545
//
//  Created by David Kim on 4/9/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit


class EditViewHandle {
    static var fontSize:CGFloat = 16
    static var courseNameLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Course Name: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionDateLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Session Date: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var occasionLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Occasion: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var occasionDateLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Occasion Date: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var addressLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Location: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var organizerLabel : UILabel = {
        let lbl = UILabel()
        lbl.text = "Organizer: "
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.font = lbl.font.bold()
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var dummy1 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var dummy2 : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionCourseName : UITextField = {
        let lbl = UITextField()
        lbl.textColor = .gray
        lbl.font = UIFont.boldSystemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        return lbl
    }()

    static var sessionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOccasionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionAddress : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOccasion : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOrganizer : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    static func setLabels(selected : Session) {
        //        SessionViewHandle.sessionCourseName.text = SessionViewHandle.sessionCourseName.text! +  selected.courseName
        SessionViewHandle.sessionCourseName.text = selected.courseName
        SessionViewHandle.sessionDate.text = selected.sessionDate
        SessionViewHandle.sessionOccasion.text = selected.occasion
        SessionViewHandle.sessionOccasionDate.text = selected.occasionDate
        SessionViewHandle.sessionAddress.text = selected.addressOfSession
        SessionViewHandle.sessionOrganizer.text = selected.organizer
    }
    
}

