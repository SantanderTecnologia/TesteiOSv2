//
//  KeyboardObserver.swift
//  CodeSnippets
//
//  Created by Bruno Maciel on 8/22/20.
//  Copyright © 2020 brunomaciel. All rights reserved.
//

import UIKit

/* Keyboard Observer Class
 
 * Purpose:
 *  - Scroll a ScrollView when a TextField is selected and keyboard appears
 *     in order to garantee the keyboard doesn't overlays the TextField
 
 * Access Method:
 *  - use the addKeyboardObserver(scrollView:name:) extension method of UIViewController
 *  - MUST keep this method in this file
 
 * Properties:
 *  - viewController:          UIViewController that will add the observer
 *  - currentScrollView:       UIScrollView that will scroll
 *  - name:                    Name for the Observer, just as a matter of debugging, has an empty default value
 *  - currentActiveObservers:  Array of KeyboardObserver that store all existent observers in the order they were created
 *  - isCurrentActiveObserver: Inform if observer is the last one in currentActiveObserver list, which means it's the last one created
 
 * Methods:
 *  - addKeyboardObserver():       Add the NotificationCenter observers
 *  - removeFromActiveObservers(): Remove the observer from the currentActiveOberserver list when it's deinitialized
 *  - keyboardWillShow():          Scrolls the ScrollView to place the selected TextField right above the keyboard
 *  - keyboardWillBeHidden():      Scrolls the ScrollView back to original position
 *  - ==():                        Auxiliary method to allow comparison
 
 */


class KeyboardObserver: Equatable {
    // MARK: Properties
    private weak var viewController: UIViewController?
    private weak var currentScrollView: UIScrollView?
    var name: String
    
    static private var currentActiveObservers: [KeyboardObserver] = []
    
    // Computed Properties
    private var myScrollView: UIScrollView? {
        get { return self.currentScrollView }
        set { self.currentScrollView = newValue }
    }
    
    private var isCurrentActiveObserver: Bool {
        KeyboardObserver.currentActiveObservers = KeyboardObserver.currentActiveObservers.filter({ $0.viewController != nil })
        return self == KeyboardObserver.currentActiveObservers.last
    }
    
    
    // MARK: Init & Deinit
    fileprivate init(in vc: UIViewController, for scrollView: UIScrollView, named name: String="") {
        self.viewController = vc
        self.currentScrollView = scrollView
        self.name = name
        
        self.addKeyboardObserver()
        KeyboardObserver.currentActiveObservers.append(self)
        
        print("KeyboardObserver \(self.name) created")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
        self.removeFromActiveObservers()
        
        print("KeyboardObserver \(self.name) deleted")
    }
    
    
    // MARK: Private Methods
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillBeHidden),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeFromActiveObservers() {
        KeyboardObserver.currentActiveObservers = KeyboardObserver.currentActiveObservers.filter({ $0 != self })
    }
    
    @objc private func keyboardWillShow(sender notification: Notification) {
        // Check if observer is the last created in order to avoid computational effort
        if !self.isCurrentActiveObserver { return }
        
        // Find is there's a ScrollView in ViewController
        guard let scrollView = self.myScrollView else { print("No ScrollView found at \(self.name)"); return }
        
        // Find which TextField/TextView is the firstResponder and if it's in the ScrollView
        var activeTextField: UITextField?
        var activeTextView: UITextView?
        guard let firstResponder = scrollView.window?.firstResponder else { print("No FirstResponder found at \(self.name)"); return }
        if let responder = firstResponder as? UITextField { activeTextField = responder }
        else if let responder = firstResponder as? UITextView { activeTextView = responder }
        else { print("No TextField/TextView found at \(self.name)"); return }
        
        let activeField = (activeTextField ?? activeTextView!)
        
        
        // Find keyboard's height
        let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        guard let keyboardHeight = keyboardSize?.height else { return }
        
        // Scroll for keyboard's height + 5 (considers the safeArea, it's important for the iPhone X)
        let extraOffset: CGFloat = 5
        let safeAreaBottom = self.viewController?.view.safeAreaInsets.bottom ?? 0
        let bottomInset = (keyboardHeight - safeAreaBottom) + extraOffset
        let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: bottomInset, right: 0.0)
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
        
        let activeRect = activeField.convert(activeField.bounds, to: scrollView)
        scrollView.scrollRectToVisible(activeRect, animated: true)
    }

    @objc private func keyboardWillBeHidden(notification: Notification) {
        let contentInsets = UIEdgeInsets.zero
        guard let scrollView = self.myScrollView else { print("No ScrollView found at \(self.name)"); return }
        scrollView.contentInset = contentInsets
        scrollView.scrollIndicatorInsets = contentInsets
    }
    
    
    // MARK: Equatable Methods
    static func == (lhs: KeyboardObserver, rhs: KeyboardObserver) -> Bool {
        return lhs.viewController == rhs.viewController
    }
    
}


// MARK: - Extensions Needed

extension UIViewController {
    func addKeyboardObserver(for scrollView: UIScrollView, named name: String="") {
        _ = KeyboardObserver(in: self, for: scrollView, named: name)
    }
}

extension UIView {
    fileprivate var firstResponder: UIView? {
        if self.isFirstResponder { return self }

        for subview in self.subviews {
            if let firstResponder = subview.firstResponder {
                return firstResponder
            }
        }
        return nil
    }
}
