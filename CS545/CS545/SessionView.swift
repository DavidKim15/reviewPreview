//
//  SessionView.swift
//  CS545
//
//  Created by David Kim on 4/8/19.
//  Copyright © 2019 David Kim. All rights reserved.
//

import UIKit
import SQLite

class SessionView: UIViewController {
    
    var editView: UIView!
    var selectedSession : Session = Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        editView.isHidden = true
        initializePage()
    }
    
    func initializePage() {
        SessionViewHandle.setLabels(selected: selectedSession)
        SessionViewHandle.editButton.addTarget(self, action: #selector(editSession), for: .touchUpInside)
        SessionViewHandle.editButton.frame.size.height = 50
        SessionViewHandle.deleteButton.addTarget(self, action: #selector(deleteSession), for: .touchUpInside)
        self.view.addSubview(SessionViewHandle.dummy2)
        self.view.addSubview(SessionViewHandle.sessionCourseName)
        self.view.addSubview(SessionViewHandle.sessionDate)
        self.view.addSubview(SessionViewHandle.sessionOccasion)
        self.view.addSubview(SessionViewHandle.sessionOccasionDate)
        self.view.addSubview(SessionViewHandle.sessionAddress)
        self.view.addSubview(SessionViewHandle.sessionOrganizer)
        
        self.view.addSubview(SessionViewHandle.editButton)
        self.view.addSubview(SessionViewHandle.deleteButton)
        
        self.view.addSubview(SessionViewHandle.dummy1)
        self.view.addSubview(SessionViewHandle.courseNameLabel)
        self.view.addSubview(SessionViewHandle.sessionDateLabel)
        self.view.addSubview(SessionViewHandle.occasionLabel)
        self.view.addSubview(SessionViewHandle.occasionDateLabel)
        self.view.addSubview(SessionViewHandle.addressLabel)
        self.view.addSubview(SessionViewHandle.organizerLabel)
        
        let labelStack = UIStackView(arrangedSubviews: [SessionViewHandle.dummy1,
                                                        SessionViewHandle.courseNameLabel,
                                                        SessionViewHandle.sessionDateLabel,
                                                        SessionViewHandle.organizerLabel,
                                                        SessionViewHandle.occasionLabel,
                                                        SessionViewHandle.occasionDateLabel,
                                                        SessionViewHandle.addressLabel])
        labelStack.distribution = .equalSpacing
        labelStack.axis = .vertical
        labelStack.alignment = .trailing
        //        labelStack.spacing = 5
        self.view!.addSubview(labelStack)
        labelStack.anchor(top: self.view.topAnchor,
                          left: self.view.leftAnchor,
                          bottom: self.view.bottomAnchor,
                          right: self.view.rightAnchor,
                          paddingTop: 0,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          paddingRight: 50,
                          width: 0,
                          height: 0,
                          enableInsets: false)
        let itemStack = UIStackView(arrangedSubviews: [SessionViewHandle.dummy2,
                                                       SessionViewHandle.sessionCourseName,
                                                       SessionViewHandle.sessionDate,
                                                       SessionViewHandle.sessionOrganizer,
                                                       SessionViewHandle.sessionOccasion,
                                                       SessionViewHandle.sessionOccasionDate,
                                                       SessionViewHandle.sessionAddress])
        itemStack.distribution = .equalSpacing
        itemStack.axis = .vertical
        itemStack.alignment = .leading
        //        itemStack.spacing = 5
        self.view!.addSubview(itemStack)
        itemStack.anchor(top: self.view.topAnchor,
                         left: self.view.leftAnchor,
                         bottom: self.view.bottomAnchor,
                         right: self.view.rightAnchor,
                         paddingTop: 0,
                         paddingLeft: 0,
                         paddingBottom: 0,
                         paddingRight: 0,
                         width: 0,
                         height: 0,
                         enableInsets: false)
        let overStack = UIStackView(arrangedSubviews: [labelStack,itemStack])
        overStack.distribution = .fillProportionally
        overStack.axis = .horizontal
        self.view!.addSubview(overStack)
        overStack.anchor(top: self.view.topAnchor,
                         left: self.view.leftAnchor,
                         bottom: nil,
                         right: self.view.rightAnchor,
                         paddingTop: 50,
                         paddingLeft: 0,
                         paddingBottom: 200,
                         paddingRight: 0,
                         width: 0,
                         height: 0,
                         enableInsets: false)
        SessionViewHandle.editButton.anchor(top: overStack.bottomAnchor,
                                            left: self.view.leftAnchor,
                                            bottom: self.view.bottomAnchor,
                                            right: nil,
                                            paddingTop: 50,
                                            paddingLeft: 50,
                                            paddingBottom: 100,
                                            paddingRight: 0,
                                            width: 0,
                                            height: 0,
                                            enableInsets: false)
        SessionViewHandle.deleteButton.anchor(top: overStack.bottomAnchor,
                                              left: nil,
                                              bottom: self.view.bottomAnchor,
                                              right: self.view.rightAnchor,
                                              paddingTop: 50,
                                              paddingLeft: 0,
                                              paddingBottom: 100,
                                              paddingRight: 50,
                                              width: 0,
                                              height: 0,
                                              enableInsets: false)
    }
    private func loadEditViewIntoController() {
        let customEditFrame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height - 200)
        editView = UIView(frame: customEditFrame)
        editView.backgroundColor = .black
        self.view.addSubview(editView)
        editView.isHidden = false
        
        // any other objects should be tied to this view as superView
        // for example adding this okayButton
        let okayButtonFrame = CGRect(x: 40, y: 100, width: 50, height: 50)
        let okayButton = UIButton(frame: okayButtonFrame )
        
        // here we are adding the button its superView
        editView.addSubview(okayButton)
        okayButton.addTarget(self, action: #selector(didPressButtonFromEditView), for: .touchUpInside)
    }
    
    
    @objc func didPressButtonFromEditView(sender:UIButton) {
        // do whatever you want
        // make view disappears again, or remove from its superview
        editView.isHidden = true
    }
    @objc func editSession(sender: UIButton) {
        print("Clicked")
        loadEditViewIntoController()
    }
    @objc func deleteSession(sender: UIButton) {
        
    }
    
}
