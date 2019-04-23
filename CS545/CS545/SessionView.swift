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
    var selectedSession : (Session,Int64) = (Session(courseName: "",sessionDate: "",occasionDate: "",addressOfSession: "",occasion: "",organizer: "", dateObjOccasion: Date(), dateObjSession : Date()), -1)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        editView.isHidden = true
        initializePage()
    }
    
    func initializePage() {
        SessionViewHandle.setLabels(selected: selectedSession.0)
        SessionViewHandle.editButton.addTarget(self, action: #selector(editOrganizerViewSession), for: .touchUpInside)
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
                                            paddingLeft: 100,
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
                                              paddingRight: 100,
                                              width: 0,
                                              height: 0,
                                              enableInsets: false)
    }
    private func loadEditViewIntoController() {
//        let customEditFrame = CGRect(x: (view.frame.width*1/3)/2, y: 0, width: view.frame.width*2/3, height: view.frame.height*2/3)
        let customEditFrame = CGRect(x: (view.frame.width*1/3)/2, y: 0, width: view.frame.width*2/3, height: view.frame.height-100)
        editView = UIView(frame: customEditFrame)
        editView.backgroundColor = .white
        self.view.addSubview(editView)
        editView.isHidden = false
        
        editView.addSubview(SessionViewHandle.dummy1)
        editView.addSubview(SessionViewHandle.courseNameLabel)
        editView.addSubview(SessionViewHandle.sessionDateLabel)
        editView.addSubview(SessionViewHandle.occasionLabel)
        editView.addSubview(SessionViewHandle.occasionDateLabel)
        editView.addSubview(SessionViewHandle.addressLabel)
        editView.addSubview(SessionViewHandle.organizerLabel)
        
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
        self.view!.addSubview(labelStack)
        labelStack.anchor(top: editView.topAnchor,
                          left: editView.leftAnchor,
                          bottom: editView.bottomAnchor,
                          right: editView.rightAnchor,
                          paddingTop: 0,
                          paddingLeft: 0,
                          paddingBottom: 0,
                          paddingRight: 50,
                          width: 0,
                          height: 0,
                          enableInsets: false)
        
        // any other objects should be tied to this view as superView
        // for example adding this okayButton
        let okayButtonFrame = CGRect(x: 0, y: 0, width: 75, height: 25)
        let okayButton = UIButton(frame: okayButtonFrame )
        okayButton.setTitle("Edit", for: .normal)
        okayButton.setTitleColor(.blue,for: .normal)
        okayButton.layer.borderWidth = 1
        okayButton.layer.borderColor = UIColor.blue.cgColor
        okayButton.layer.cornerRadius = 5
        
        // here we are adding the button its superView
        editView.addSubview(okayButton)
        okayButton.anchor(top: nil,
                          left: editView.leftAnchor,
                          bottom: editView.bottomAnchor,
                          right: editView.rightAnchor,
                          paddingTop: 0,
                          paddingLeft: 100,
                          paddingBottom: 50,
                          paddingRight: 100,
                          width: 0,
                          height: 0,
                          enableInsets: false)
        okayButton.addTarget(self, action: #selector(loadEdits), for: .touchUpInside)
    }
    
    
    @objc func loadEdits(sender:UIButton) {
        // do whatever you want
        // make view disappears again, or remove from its superview
        editView.isHidden = true
    }
    @objc func editOrganizerViewSession(sender: UIButton) {
        self.performSegue(withIdentifier: "editOrganizerView", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("From session_view");
        print(self.navigationController?.viewControllers)
        if segue.identifier == "editOrganizerView" {
            if let organizerView = segue.destination as? organizerView {
                organizerView.editingSelectedSession = selectedSession     
            }
        }
    }

    @objc func deleteSession(sender: UIButton) {
        if dbWrapper.instance.deleteSession(sid: selectedSession.1) {
//            self.performSegue(withIdentifier: "deletedSession", sender:self)
//            NotificationCenter.default.post(name: Notification.Name("Load"), object: nil)
            self.navigationController?.popViewController(animated: true)
//            self.performSegue(withIdentifier: "deleteSession", sender: self)
        }
    }
    
}
