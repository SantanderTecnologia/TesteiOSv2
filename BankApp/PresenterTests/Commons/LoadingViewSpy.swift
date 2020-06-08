//
//  LoadingViewSpy.swift
//  PresenterTests
//
//  Created by Estaife Lima on 04/06/20.
//  Copyright © 2020 Estaife Lima. All rights reserved.
//

import Presenter

class LoadingViewSpy {
    public internal(set)var isLoading: Bool = false
    private var emit: ((Bool) -> Void)?
    
    func observerLoading(completion: @escaping  ((Bool) -> Void)) {
        emit = completion
    }
    
    private func sendEmit() {
        isLoading.toggle()
        emit?(isLoading)
    }
}

extension LoadingViewSpy: LoadingViewProtocol {
    
    func start() {
        sendEmit()
    }
    
    func stop() {
        sendEmit()
    }
}
