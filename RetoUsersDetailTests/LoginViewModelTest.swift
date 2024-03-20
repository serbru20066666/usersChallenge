//
//  LoginViewModelTest.swift
//  RetoUsersDetailTests
//
//  Created by BrunoBCP on 20/03/24.
//

import XCTest
import Combine
@testable import RetoUsersDetail

class LoginViewModelTests: XCTestCase {
    
    private var viewModel: LoginViewModel!
    
    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }
    
    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testSuccessfulLogin() {
        let username = "Testuser"
        let password = "password"
        
        viewModel.username = username
        viewModel.password = password
        
        viewModel.login()
        
        XCTAssertFalse(viewModel.showAlert)
        XCTAssertTrue(viewModel.isLoggedIn)
    }
    
    func testFailedLogin() {
        let username = "WrongUser"
        let password = "WrongPassword"
        
        viewModel.username = username
        viewModel.password = password
        
        viewModel.login()
        
        XCTAssertTrue(viewModel.showAlert)
        XCTAssertFalse(viewModel.isLoggedIn)
    }
    
    func testSessionExpiration() {
        UserDefaults.standard.setValue(Date(timeIntervalSinceNow: -15), forKey: "SessionStartTime")

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.viewModel.checkSessionExpiration()
            XCTAssertTrue(self.viewModel.showSessionExpiredAlert) // Assert session expired alert shown
        }

        UserDefaults.standard.removeObject(forKey: "SessionStartTime")
    }
    
}
