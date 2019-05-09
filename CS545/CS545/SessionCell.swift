import UIKit
class SessionCell : UITableViewCell {
    
    var session : Session? {
        didSet {
            sessionCourseName.text = session?.courseName
            sessionDate.text = session?.sessionDate
            sessionAddress.text = session?.addressOfSession
            sessionOccasion.text = session?.occasion
            sessionOrganizer.text = session?.organizer
            sessionOccasionDate.text = session?.occasionDate
        }
    }
    
    private let sessionCourseName : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0xAE2A2A)
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let sessionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x515151)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOccasionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x515151)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionAddress : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x515151)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOccasion : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x515151)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOrganizer : UILabel = {
        let lbl = UILabel()
        lbl.textColor = UIColor(rgb: 0x515151)
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sessionCourseName)
        addSubview(sessionDate)
        addSubview(sessionAddress)
        addSubview(sessionOccasion)
        addSubview(sessionOrganizer)
        addSubview(sessionOccasionDate)
        
        sessionCourseName.anchor(top: topAnchor,
                                 left: leftAnchor,
                                 bottom: nil,
                                 right: nil,
                                 paddingTop: 0,
                                 paddingLeft: 20,
                                 paddingBottom: 0,
                                 paddingRight: 0,
                                 width: frame.size.width / 3,
                                 height: 0,
                                 enableInsets: false)
        sessionDate.anchor(top: sessionCourseName.bottomAnchor,
                           left: leftAnchor,
                           bottom: bottomAnchor,
                           right: nil,
                           paddingTop: 0,
                           paddingLeft: 20,
                           paddingBottom: 0,
                           paddingRight: 0,
                           width: frame.size.width / 3,
                           height: 0,
                           enableInsets: false)
        sessionOccasion.anchor(top: topAnchor,
                               left: sessionCourseName.rightAnchor,
                               bottom: nil,
                               right: nil,
                               paddingTop: 10,
                               paddingLeft: 0,
                               paddingBottom: 0,
                               paddingRight: 0,
                               width: frame.size.width / 3,
                               height: 0,
                               enableInsets: false)
        sessionOccasionDate.anchor(top: sessionOccasion.bottomAnchor,
                                   left: sessionCourseName.rightAnchor,
                                   bottom: nil,
                                   right: nil,
                                   paddingTop: 0,
                                   paddingLeft: 0,
                                   paddingBottom: 0,
                                   paddingRight: 0,
                                   width: frame.size.width / 3,
                                   height: 0,
                                   enableInsets: false)
        sessionOrganizer.anchor(top: topAnchor,
                                left: sessionOccasion.rightAnchor,
                                bottom: nil,
                                right: nil,
                                paddingTop: 10,
                                paddingLeft: 0,
                                paddingBottom: 0,
                                paddingRight: 0,
                                width: frame.size.width / 3,
                                height: 0,
                                enableInsets: false)
        sessionAddress.anchor(top: sessionOrganizer.bottomAnchor,
                              left: sessionOccasion.rightAnchor,
                              bottom: nil,
                              right: nil,
                              paddingTop: 0,
                              paddingLeft: 0,
                              paddingBottom: 0,
                              paddingRight: 0,
                              width: frame.size.width / 3,
                              height: 0,
                              enableInsets: false)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
