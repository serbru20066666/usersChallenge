//
//  LoginView.swift
//  RetoUsersDetail
//
//  Created by BrunoBCP on 20/03/24.
//

import SwiftUI

struct LoginView: View {
  @ObservedObject var viewModel: LoginViewModel
  @State private var showErrorLabel = false

  var body: some View {
    NavigationView {
      VStack {
        Text("Challenge").font(.title2).bold()

        HStack(spacing: 0) {
          Image(systemName: "person.fill")
            .foregroundColor(.gray)
            .frame(width: 30)
          TextField("Username", text: $viewModel.username)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .foregroundColor(.gray)
            .frame(minHeight: 44)
        }

        HStack(spacing: 0) { // Remove spacing between TextFields
          Image(systemName: "lock.fill") // Optional icon (adjust size as needed)
            .foregroundColor(.gray)
            .frame(width: 30) // Set icon width
          SecureField("Password", text: $viewModel.password)
            .textFieldStyle(RoundedBorderTextFieldStyle()) // Removed unnecessary nesting
            .foregroundColor(.gray)
            .frame(minHeight: 54) // Set minimum TextField height (adjust as needed)
        }

        HStack {
          Spacer()
          Button("Login") {
            viewModel.login()
            showErrorLabel = !viewModel.isLoggedIn
          }
          .padding()
          .foregroundColor(.white)
          Spacer()
        }
        .background(Color.black)
        .clipShape(RoundedRectangle(cornerRadius: 10))

        if showErrorLabel {
          Text("Invalid credentials")
            .foregroundColor(.red)
            .padding(.top, 5)
        }
      }
      .padding(.horizontal, 20) // Padding for VStack content
      .background( // Background for entire view
        NavigationLink(destination: LoginRouter.showUsersList().navigationBarHidden(true), isActive: $viewModel.isLoggedIn) {
          EmptyView()
        }
        .hidden()
      )
      .alert(isPresented: $viewModel.showSessionExpiredAlert) {
        Alert(title: Text("Session Expired"), message: Text("Your session has expired. Please log in again."), dismissButton: .default(Text("OK")) {
          viewModel.isLoggedIn = false
        })
      }
    }
  }
}

#if DEBUG
struct LoginView_Previews: PreviewProvider {
  static var previews: some View {
    let viewModel = LoginViewModel()
    return LoginConfiguration.configureLoginView(viewModel: viewModel)
  }
}
#endif
