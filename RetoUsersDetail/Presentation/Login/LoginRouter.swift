//
//  LoginRouter.swift
//  RetoUsersDetail
//
//  Created by BrunoBCP on 20/03/24.
//

import SwiftUI

final class LoginRouter {
    public static func showUsersList() -> some View {
        return UsersConfigurator.configureUsersView()
    }
}
