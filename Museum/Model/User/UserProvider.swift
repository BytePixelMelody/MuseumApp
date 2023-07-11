//
//  UserProvider.swift
//  Museum
//
//  Created by Vyacheslav on 10.07.2023.
//

import Foundation

protocol UserProviderProtocol {
    init(jsonService: JsonServiceProtocol)
    func setUser(user: User)
    func getUser() -> User?
    func deleteUser()
}

class UserProvider: UserProviderProtocol {
    
    let jsonService: any JsonServiceProtocol
    
    required init(jsonService: JsonServiceProtocol) {
        self.jsonService = jsonService
    }
    
    func setUser(user: User) {
        jsonService.write(dataObject: user)
    }
    
    func getUser() -> User? {
        jsonService.read(type: User.self)
    }
    
    func deleteUser() {
        jsonService.delete(type: User.self)
    }
    
}
