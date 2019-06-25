
import UIKit

class LoginWorker{
    let baseWorker = BaseWorker()
    
    func authenticatorLogin(from userParams: DataUserAuthentication,
                            completion: @escaping ((_ user: LoginResponse) -> Void),
                            failure: @escaping BaseWorker.completionError) {
        
        baseWorker.post(router: .login, body: userParams, success: { (user: LoginResponse?) in
            guard let user = user else {
                return
            }
            completion(user)
        }, error: failure)
    }
}
