import Foundation


/**
 CommonDataLayerEndpointBuilderEnum is a enum that stores and helps to build all endpoint used in the CommonDataLayer.

        let myDummyEndpoint = CommonDataLayerEndpointBuilderEnum.getDummy(ID: "Dummy_ID").endpoint
 */



enum CommonDataLayerEndpointBuilderEnum{
    
    //TODO: add all endpoints here
    case postLogin
    case getStatements(userID : Int)
    
    /**
     This property returns the String of the endpoint with all the arguments
     - Returns: String
     */
    var endpoint : String{
        switch self {
        case .postLogin:
            return "\(BankAppUtils.baseURL)login"
        case .getStatements(let userID):
            return "\(BankAppUtils.baseURL)statements/\(userID)"
        default:
            return ""
        }
    }
}

