//
//  TimelineViewModel.swift
//  Teste_iOS_v2
//
//  Created by Lucas Fernandes Araujo on 04/08/20.
//  Copyright © 2020 Lucas Fernandes Araujo. All rights reserved.
//

import UIKit

struct TimelineViewModel {
    private var list = [TimelineModel]()
    
    mutating func refreshList(_ list: [TimelineModel]) {
        self.list = list
    }
    
    func numberOfRows() -> Int {
        return list.count
    }
    
    func rowHeight() -> CGFloat {
        return 100
    }
    
    func getActualTransaction(index: Int) -> TimelineModel {
        return list[index]
    }
    
    
}
