import Foundation
import UIKit


extension NSMutableAttributedString{
    
    /**
      This function will set part of the string (subString) in the color you want.
      - Parameter textToFind: substring you want to highlight in the attibuted string
      - Parameter color: color you want to highlight the given string
      - Parameter compareOptions: is an optional parameter that tells if you want to be .caseInsensitive or .literal
     
     Example:
     ```
     let string = NSMutableAttributedString(string: "Hello world!")
     string.setColorForText("world", with: UIColor.red)
     myLabel.attributedText = string
     ```
     */
    public func setColorForText(_ textToFind: String, with color: UIColor, compareOptions : NSString.CompareOptions = .caseInsensitive) {
        let range = self.mutableString.range(of: textToFind, options: compareOptions)
        if range.location != NSNotFound {
            addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
        }
    }
}
