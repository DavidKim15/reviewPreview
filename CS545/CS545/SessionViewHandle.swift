//
//  SessionViewHandle.swift
//  CS545
//
//  Created by David Kim on 4/9/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit

extension UIFont {
    
    func withTraits(traits:UIFontDescriptor.SymbolicTraits...) -> UIFont {
        let descriptor = self.fontDescriptor.withSymbolicTraits(UIFontDescriptor.SymbolicTraits(traits))
        return UIFont(descriptor: descriptor!, size: 0)
    }
    
    func bold() -> UIFont {
        return withTraits(traits: .traitBold)
    }
    
    func italic() -> UIFont {
        return withTraits(traits: .traitItalic)
    }
    
    func boldItalic() -> UIFont {
        return withTraits(traits: .traitBold, .traitItalic)
    }
    
}

class SessionViewHandle {
    static var fontSize:CGFloat = 24
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
    static var sessionCourseName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: fontSize)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
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
    static var editButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 100,width: 100, height: 25))
        btn.setTitle("Edit Session", for: .normal)
        btn.setTitleColor(.blue,for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
//        btn.layer.cornerRadius = 5
//        btn.layer.borderWidth = 1
//        btn.layer.borderColor = UIColor.blue.cgColor
//        btn.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        return btn
    }()
    
    static var deleteButton: UIButton = {
        let btn = UIButton(frame: CGRect(x: 100, y: 100,width: 100, height: 25))
        btn.setTitle("Delete Session", for: .normal)
        btn.setTitleColor(.red,for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
//        btn.layer.cornerRadius = 5
//        btn.layer.borderWidth = 1
//        btn.layer.borderColor = UIColor.blue.cgColor
//        btn.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        return btn
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

