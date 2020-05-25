import Foundation
import UIKit

extension UIImageView {
    public func imageFromServerURL(urlString: String) {
        
        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { data, response, error -> Void in
            if error != nil {
                return
            }
            
            if response == nil {
                return
            }
            
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self.image = image
            })
            
        }).resume()
    }
    
    public func setRound(){
        self.layer.cornerRadius = self.frame.height/2
        self.clipsToBounds = true
    }
}
