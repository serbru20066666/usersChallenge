//
//  Users.swift
//  RetoUsersDetail
//
//  Created by Bruno on 19/03/24.
//

import Foundation

struct Users: Codable, Equatable {
    let data: [User]
}

extension Users {
    static func == (lhs: Users, rhs: Users) -> Bool {
        return lhs.data == rhs.data
    }
}
