
import UIKit
import Alamofire

class StatementsWorker
{
    let baseWorker = BaseWorker()
    func statements(_ completion: @escaping (_ statements: [Statemeant]) -> Void,
                    failure: @escaping BaseWorker.completionError) {
        baseWorker.get(router: .statemeant, success: { (statement: StatemeantList?) in
            completion(statement?.statementList ?? [])
        }, error: failure)
    }
}
