// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	func testLane() {
        desc("Run the unit tests")
        scan(
            workspace: "BankApp.xcworkspace",
            clean: true
        )
	}
    
    func setupLane() {
        desc("Install pods used by the project")
        cocoapods()
    }
}
