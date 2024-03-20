//
//  LoginViewModel.swift
//  RetoUsersDetail
//
//  Created by BrunoBCP on 20/03/24.
//
import SwiftUI
import Combine

enum NavigationState {
    case loggedIn
}

class LoginViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var showAlert = false
    @Published var isLoggedIn = false // Indicates whether user is logged in
    @Published var showSessionExpiredAlert = false // Indicates whether to show session expired alert
    
    private var cancellables = Set<AnyCancellable>()
    private var timer: Timer?
    
    init() {
        startSessionExpirationTimer()
    }
    
    deinit {
        timer?.invalidate()
    }
    
    func login() {
        // This is a mocked local function
        let mockedUser = LoginUser(username: "Testuser", password: "password")
        if username == mockedUser.username && password == mockedUser.password {
            showAlert = false
            isLoggedIn = true
            UserDefaults.standard.set(Date(), forKey: "SessionStartTime")
        } else {
            showAlert = true
            isLoggedIn = false // Ensure isLoggedIn is set to false when login fails
        }
    }
    
    private func startSessionExpirationTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 10, repeats: true) { [weak self] _ in
            self?.checkSessionExpiration()
        }
    }
    
    private func checkSessionExpiration() {
        if let sessionStartTime = UserDefaults.standard.object(forKey: "SessionStartTime") as? Date {
            let currentTime = Date()
            let elapsedTime = currentTime.timeIntervalSince(sessionStartTime)
            if elapsedTime > 10 && isLoggedIn {
                showSessionExpiredAlert = true
                timer?.invalidate()
            }
        }
    }
}
