import Foundation
import Alamofire

enum Routers: String {
    case login = "login"
    case statemeant = "statements/1"
}

class API {
    private static var baseURL = "https://bank-app-test.herokuapp.com/api/"
    
    static func urlOf(_ route: Routers) -> String {
        return baseURL + route.rawValue
    }
}


class BaseWorker {
    
    typealias completionSuccess<U: Decodable> = ((_ response: U?) -> Void)
    typealias completionError = ((_ message: String?) -> Void)
    
    func post<T: Encodable, U: Decodable>(router: Routers,
                            body: T,
                            success: @escaping completionSuccess<U>,
                            error: @escaping completionError) {
        
        request(method: .post, router: router, body: body, success: success, error: error)
    }
    
    func get<U: Decodable>(router: Routers,
                           success: @escaping completionSuccess<U>,
                           error: @escaping completionError) {
        let url = API.urlOf(router)
        Alamofire.request(url, method: .get, parameters: nil).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let decodable = try JSONDecoder().decode(U.self, from: data)
                        success(decodable)
                    } catch let e {
                        error(e.localizedDescription)
                    }
                }
            case .failure(let e):
                error(e.localizedDescription)
            }
        })
    }
    
    private func request<T: Encodable, U: Decodable>(method: HTTPMethod,
                                     router: Routers,
                                     body: T? = nil,
                                     success: @escaping completionSuccess<U>,
                                     error: @escaping completionError) {
        let url = API.urlOf(router)
        let parameters = converteToDictionary(from: body)
        Alamofire.request(url, method: method, parameters: parameters).responseJSON(completionHandler: {
            response in
            switch response.result {
            case .success(_):
                if let data = response.data {
                    do {
                        let decodable = try JSONDecoder().decode(U.self, from: data)
                        success(decodable)
                    } catch let e {
                        error(e.localizedDescription)
                    }
                }
            case .failure(let e):
                error(e.localizedDescription)
            }
        })
    }
    
    private func converteToDictionary<T: Encodable>(from codable: T?) -> [String: Any]? {
        guard (codable != nil) else {
            return nil
        }
        if let data = try? JSONEncoder().encode(codable) {
            guard let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else {
                return nil
            }
            return dictionary
        }
        return nil
    }
}
