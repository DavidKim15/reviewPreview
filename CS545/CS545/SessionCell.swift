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
        lbl.textColor = .blue
        lbl.font = UIFont.boldSystemFont(ofSize: 20)
        lbl.textAlignment = .left
        return lbl
    }()
    
    
    private let sessionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOccasionDate : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionAddress : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOccasion : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    private let sessionOrganizer : UILabel = {
        let lbl = UILabel()
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        lbl.textAlignment = .left
        lbl.numberOfLines = 0
        return lbl
    }()
    
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(sessionCourseName)
        addSubview(sessionDate)
        addSubview(sessionAddress)
        addSubview(sessionOccasion)
        addSubview(sessionOrganizer)
        addSubview(sessionOccasionDate)
//        addSubview(increaseButton)
        
        sessionCourseName.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, paddingTop: 5, paddingLeft: 20, paddingBottom: 5, paddingRight: 0, width: 90, height: 0, enableInsets: false)
        sessionDate.anchor(top: sessionCourseName.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        sessionOccasion.anchor(top: topAnchor, left: sessionCourseName.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        sessionOccasionDate.anchor(top: sessionOccasion.bottomAnchor, left: sessionCourseName.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        sessionOrganizer.anchor(top: topAnchor, left: sessionOccasion.rightAnchor, bottom: nil, right: nil, paddingTop: 10, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        sessionAddress.anchor(top: sessionOrganizer.bottomAnchor, left: sessionOccasion.rightAnchor, bottom: nil, right: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 0, paddingRight: 0, width: frame.size.width / 2, height: 0, enableInsets: false)
        
        
//        let stackView = UIStackView(arrangedSubviews: [decreaseButton,productQuantity,increaseButton])
//        stackView.distribution = .equalSpacing
//        stackView.axis = .horizontal
//        stackView.spacing = 5
//        addSubview(stackView)
//        stackView.anchor(top: topAnchor, left: productNameLabel.rightAnchor, bottom: bottomAnchor, right: rightAnchor, paddingTop: 15, paddingLeft: 5, paddingBottom: 15, paddingRight: 10, width: 0, height: 70, enableInsets: false)
//
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
