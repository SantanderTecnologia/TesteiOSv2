import Foundation
import UIKit

extension Bundle {
    var appName: String? {
        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String
    }
    
    var appVersion: String? {
        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
    }
    
    var appBuild: String? {
        return object(forInfoDictionaryKey: "CFBundleVersion") as? String
    }
}
