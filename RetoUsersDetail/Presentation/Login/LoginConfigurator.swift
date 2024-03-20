//
//  LoginConfigurator.swift
//  RetoUsersDetail
//
//  Created by BrunoBCP on 20/03/24.
//

import Foundation

final class LoginConfiguration {
    public static func configureLoginView(viewModel: LoginViewModel) -> LoginView {
        return LoginView(viewModel: viewModel)
    }
}
