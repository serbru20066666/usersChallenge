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
                    picture: "https://scontent.flim33-1.fna.fbcdn.net/v/t39.30808-6/384435780_10228633283391510_3500165189689684899_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=5f2048&_nc_eui2=AeH57VClDQN5kZro0hZXmbTFLLAKxyYz7g4ssArHJjPuDj_g8YgN3HEqmQ7Oau0SQIw&_nc_ohc=67MQ4xLzuwcAX874JRp&_nc_ht=scontent.flim33-1.fna&oh=00_AfA9TtCB-dn9CT3SbO0-nPWwZcY3P6PtbQ5QOyOS5FFDfw&oe=65FFF72A")
    }
}
