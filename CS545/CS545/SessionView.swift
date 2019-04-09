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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SessionViewHandle.setLabels(selected: selectedSession)
        SessionViewHandle.editButton.addTarget(self, action: #selector(editSession), for: .touchUpInside)
        SessionViewHandle.editButton.frame.size.height = 50
        SessionViewHandle.deleteButton.addTarget(self, action: #selector(deleteSession), for: .touchUpInside)
        self.view.addSubview(SessionViewHandle.dummy)
        self.view.addSubview(SessionViewHandle.sessionCourseName)
        self.view.addSubview(SessionViewHandle.sessionDate)
        self.view.addSubview(SessionViewHandle.sessionOccasion)
        self.view.addSubview(SessionViewHandle.sessionOccasionDate)
        self.view.addSubview(SessionViewHandle.sessionAddress)
        self.view.addSubview(SessionViewHandle.sessionOrganizer)
        self.view.addSubview(SessionViewHandle.editButton)
        self.view.addSubview(SessionViewHandle.deleteButton)
        
        let actionStack = UIStackView(arrangedSubviews: [SessionViewHandle.editButton,
                                                         SessionViewHandle.deleteButton])
        actionStack.distribution = .equalSpacing
        actionStack.axis = .horizontal
        actionStack.spacing = 50
        
        self.view.addSubview(actionStack)
        actionStack.anchor(top: self.view.topAnchor,
                         left: self.view.leftAnchor,
                         bottom: self.view.bottomAnchor,
                         right: self.view.rightAnchor,
                         paddingTop: 15,
                         paddingLeft: 100,
                         paddingBottom: 10,
                         paddingRight: 100,
                         width: 0,
                         height: 70,
                         enableInsets: true)
        let itemStack = UIStackView(arrangedSubviews: [SessionViewHandle.dummy,
                                                       SessionViewHandle.sessionCourseName,
                                                       SessionViewHandle.sessionDate,
                                                       SessionViewHandle.sessionOccasion,
                                                       SessionViewHandle.sessionOccasionDate,
                                                       SessionViewHandle.sessionAddress,
                                                       SessionViewHandle.sessionOrganizer,
                                                       actionStack])
        itemStack.distribution = .equalSpacing
        itemStack.axis = .vertical
        itemStack.alignment = .center
        itemStack.spacing = 5
        self.view!.addSubview(itemStack)
        itemStack.anchor(top: self.view.topAnchor,
                         left: self.view.leftAnchor,
                         bottom: self.view.bottomAnchor,
                         right: self.view.rightAnchor,
                         paddingTop: 50,
                         paddingLeft: 0,
                         paddingBottom: 100,
                         paddingRight: 0,
                         width: 0,
                         height: 0,
                         enableInsets: false)
    }
    @objc func editSession(sender: UIButton) {
        
    }
    @objc func deleteSession(sender: UIButton) {
        
    }
    
}
