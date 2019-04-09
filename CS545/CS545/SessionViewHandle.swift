//
//  SessionViewHandle.swift
//  CS545
//
//  Created by David Kim on 4/9/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit


class SessionViewHandle {
    
    static var dummy : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionCourseName : UILabel = {
        let lbl = UILabel()
        lbl.text = "Course Name: "
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    static var sessionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOccasionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionAddress : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOccasion : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var sessionOrganizer : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    static var editButton: UIButton = {
//        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        let btn = UIButton(frame: CGRect(x: 100, y: 100,width: 100, height: 25))
//        btn.translatesAutoresizingMaskIntoConstraints = true;
//        btn.frame. = 25
//        btn.frame.width = 105
        btn.setTitle("Edit Post", for: .normal)
        btn.setTitleColor(.blue,for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        return btn
    }()
    
    static var deleteButton: UIButton = {
//        let btn = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
        let btn = UIButton(frame: CGRect(x: 100, y: 100,width: 100, height: 25))
//        btn.translatesAutoresizingMaskIntoConstraints = true;
//        btn.frame.height = 25
//        btn.frame.width = 105
        btn.setTitle("Delete Post", for: .normal)
        btn.setTitleColor(.blue,for: .normal)
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.blue.cgColor
        btn.titleEdgeInsets = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        return btn
    }()

    
    static func setLabels(selected : Session) {
        SessionViewHandle.sessionCourseName.text = SessionViewHandle.sessionCourseName.text! +  selected.courseName
//        SessionViewHandle.sessionCourseName.text = selected.courseName
        SessionViewHandle.sessionDate.text = selected.sessionDate
        SessionViewHandle.sessionOccasion.text = selected.occasion
        SessionViewHandle.sessionOccasionDate.text = selected.occasionDate
        SessionViewHandle.sessionAddress.text = selected.addressOfSession
        SessionViewHandle.sessionOrganizer.text = selected.organizer
    }
    
    //    private let decreaseButton : UIButton = {
    //        let btn = UIButton(type: .custom)
    //        btn.setImage(#imageLiteral(resourceName: “minusTb”), for: .normal)
    //        btn.imageView?.contentMode = .scaleAspectFill
    //        return btn
    //    }()
    //
    //    private let increaseButton : UIButton = {
    //        let btn = UIButton(type: .custom)
    //        btn.setImage(#imageLiteral(resourceName: “addTb”), for: .normal)
    //        btn.imageView?.contentMode = .scaleAspectFill
    //        return btn
    //    }()
    
    //    var productQuantity : UILabel = {
    //        let label = UILabel()
    //        label.font = UIFont.boldSystemFont(ofSize: 16)
    //        label.textAlignment = .left
    //        label.text = "1"
    //        label.textColor = .black
    //        return label
    //
    //    }()
    
    //    private let productImage : UIImageView = {
    //        let imgView = UIImageView(image: #imageLiteral(resourceName: “glasses”))
    //        imgView.contentMode = .scaleAspectFit
    //        imgView.clipsToBounds = true
    //        return imgView
    //    }()
}

