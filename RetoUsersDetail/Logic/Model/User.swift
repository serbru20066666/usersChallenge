//
//  User.swift
//  RetoUsersDetail
//
//  Created by Bruno on 19/03/24.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    let id: String?
    let title: String?
    let firstName: String
    let lastName: String
    let email: String?
    let dateOfBirth: String?
    let registerDate: String?
    let phone: String?
    let picture: String?
}

extension User {
    static func fake() -> Self {
        return User(id: "01",
                    title: "Mock1",
                    firstName: "Bruno",
                    lastName: "Cardenas",
                    email: "brunocardenasproyectos@gmail.com",
                    dateOfBirth: "18/04/1987",
                    registerDate: "18/04/1987",
                    phone: "+51987970898",
                    picture: nil)
    }
}
