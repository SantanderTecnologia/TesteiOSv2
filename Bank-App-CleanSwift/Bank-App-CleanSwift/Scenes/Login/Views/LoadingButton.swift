//
//  LoadingButton.swift
//  Bank-App-CleanSwift
//
//  Created by Adriano Rodrigues Vieira on 18/03/21.
//

import UIKit

import UIKit

class LoadingButton: UIButton {
    private var activityIndicator: UIActivityIndicatorView!
    
    /// Constructor method for `LoadingButton`
    /// - Parameter frame: the frame where the button will be draw
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureBorders()
    }
        
    /// Constructor required for `LoadingButton`
    /// - Parameter coder: a coder
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.configureBorders()
    }
    
    
    /// Configures the borders of the button
    private func configureBorders() {
        layer.cornerRadius = 5
        clipsToBounds = true
    }
    
    
    /// Shows the 'spinner' in button while disables it
    func showActivityIndicator() {
        if (activityIndicator == nil) {
            self.activityIndicator = createActivityIndicator()
        }
        self.isEnabled = false
        self.alpha = 0.7
        self.showSpinning()
    }
    
    
    /// Stops the 'spinner' and enables the button
    func hideActivityIndicator() {
        self.activityIndicator.stopAnimating()
        self.isEnabled = true
        self.alpha = 1.0
    }
    
    
    /// Creates a activityIndicator (a.k.a. 'spinner')
    /// - Returns: an activity indicator
    private func createActivityIndicator() -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .white
        
        return activityIndicator
    }
    
    
    /// Shows the activity indicator in the button
    private func showSpinning() {
        self.activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        self.positionActivityIndicatorInButton()
        self.activityIndicator.startAnimating()
    }
    
    
    /// Places the activity indicator inside the button
    private func positionActivityIndicatorInButton() {
        let trailingConstraint = NSLayoutConstraint(item: self,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: self.activityIndicator,
                                                    attribute: .trailing,
                                                    multiplier: 1, constant: 16)
        self.addConstraint(trailingConstraint)
        let yCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: self.activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
    }    
}
