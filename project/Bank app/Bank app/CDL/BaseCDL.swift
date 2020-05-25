import Foundation


class BaseCDL {
    var cacheID = "BaseCDL"
    
    init() {
        
    }
    
    //dataRequest which sends request to given URL and convert to Decodable Object
    func dataRequest<T: Decodable>(with url: String, objectType: T.Type, httpMethod : httpMethod = .get, parameters : Data? = nil, completion: @escaping (CDLResponse<T>) -> Void) {

        guard let requestURL = URL(string: url) else{
            completion(CDLResponse.failure(CDLErrorType.invalidURLError))
            return
        }
        let session = URLSession.shared

        var request = URLRequest(url: requestURL)
        request.httpMethod = httpMethod.rawValue
        
        if let parameters = parameters {
            request.httpBody = parameters
        }
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in

            guard error == nil else {
                //It's safe to unwrap
                completion(CDLResponse.failure(CDLErrorType.networkError(error!)))
                return
            }

            guard let data = data else {
                completion(CDLResponse.failure(CDLErrorType.noDataError))
                return
            }

            do {
                // try to decode
                let decodedObject = try JSONDecoder().decode(objectType.self, from: data)
                completion(CDLResponse.success(decodedObject))
                return
            } catch let error {
                completion(CDLResponse.failure(CDLErrorType.jsonParsingError(error as! DecodingError)))
            }
        })
        task.resume()
    }
    
    
    func cleanup(subscriberID: String){
        CommonDataLayer.shared.unsubcribe(cacheID: cacheID, subscriberID: subscriberID)
    }

}

enum CDLErrorType {
    case serverError
    case noDataError
    case networkError(Error)
    case jsonParsingError(Error)
    case invalidURLError
    case invalidParameters
}

enum httpMethod : String{
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    //TODO: Add all httpMethods Here
}
