
import UIKit

@IBDesignable
class SDTextField: UITextField {
    
   @IBInspectable
    public var minLengthCharacters: String?
    var isMatchSize: Bool {
        if let sizeText = self.text?.count,
           let minLeangth = minLengthCharacters,
           let size = Int(minLeangth){
            if sizeText >= size {
                return true
            }
        }
        return false
    }
    
}
