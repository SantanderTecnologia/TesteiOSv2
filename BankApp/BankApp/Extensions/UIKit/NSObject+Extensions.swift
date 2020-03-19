//    The MIT License (MIT)
//
//    Copyright (c) 2019 Inácio Ferrarini
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.
//

import UIKit

///
/// Adds useful capabilities to NSObject.
///
extension NSObject {

    ///
    /// Extracts the simple class name of a given type.
    /// As in Swift the types names are composed with the modules they are located,
    /// this method extracts the type name without the module name.
    ///
    /// - returns: The simple class name of the type
    ///
    /// ### Usage Example: ###
    /// ````
    /// let name = "".simpleClassName() // returns "NSString"
    /// ````
    ///
    open class func simpleClassName() -> String {
        guard let className = object_getClass(self) else { return "" }
        let fullClassName: String = NSStringFromClass(className)
        let classNameComponents = fullClassName.split {$0 == "."}.map(String.init)
        return classNameComponents.last!
    }

}
