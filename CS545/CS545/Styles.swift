import Foundation
import UIKit

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
struct Theme {
    
    static var backgroundColor:UIColor?
    static var buttonTextColor:UIColor?
    static var buttonBackgroundColor:UIColor?
    static var labelTextColor:UIColor?
    static var labelBackgroundColor:UIColor?
    static var textFieldBackgroundColor:UIColor?
    
    static public func defaultTheme() {
        self.backgroundColor = UIColor(rgb: 0x5F5F5F)
        self.buttonTextColor = UIColor(rgb: 0xAE2A2A)
        self.buttonBackgroundColor = UIColor(rgb: 0x5F5F5F)
        self.labelTextColor = UIColor(rgb: 0xAE2A2A)
        self.textFieldBackgroundColor = .white
        updateDisplay()
    }
    
    static public func updateDisplay() {
        let proxyButton = UIButton.appearance()
        proxyButton.setTitleColor(Theme.buttonTextColor, for: .normal)
        proxyButton.backgroundColor = Theme.buttonBackgroundColor
        
        let proxyView = UIView.appearance()
        proxyView.backgroundColor = backgroundColor
        
        let proxyLabel = UILabel.appearance()
        proxyLabel.textColor = Theme.labelTextColor
        
        let proxyTextField = UITextField.appearance()
        proxyTextField.backgroundColor = textFieldBackgroundColor
    }
}

//red: #AE2A2A
//green: #439923
//grey: #5F5F5F
