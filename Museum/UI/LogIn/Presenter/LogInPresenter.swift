//
//  LogInPresenter.swift
//  Museum
//
//  Created by Vyacheslav on 29.01.2023.
//

import Foundation

protocol LogInViewProtocol: AnyObject {
    
}

protocol LogInPresenterProtocol: AnyObject {
    init(view: LogInViewProtocol, userProvider: UserProviderProtocol, router: Routing)
    func loginUser(email: String, password: String)
}

final class LogInPresenter: LogInPresenterProtocol {
    
    private weak var view: LogInViewProtocol?
    private let userProvider: UserProviderProtocol
    private let router: Routing
    
    required init(view: LogInViewProtocol, userProvider: UserProviderProtocol, router: Routing) {
        self.view = view
        self.userProvider = userProvider
        self.router = router
    }
    
    // show view, than write to JSON
    func loginUser(email: String, password: String) {
        let user = User(email: email, password: password)
        router.showMainViewController(user: user, withAnimation: .fromRight)
        userProvider.setUser(user: user)
    }
    
}
