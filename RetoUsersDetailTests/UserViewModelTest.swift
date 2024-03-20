//
//  UserViewModelTest.swift
//  RetoUsersDetailTests
//
//  Created by BrunoBCP on 19/03/24.
//

import XCTest
import Combine
@testable import RetoUsersDetail

class UsersViewModelTests: XCTestCase {
    
    var viewModel: UsersViewModel!
    var mockService: MockUsersService!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        mockService = MockUsersService()
        viewModel = UsersViewModel(usersService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testGetUsers() {
        // Given
        let expectedUsers = Users(data: [User.fake()]) // Using the fake user
        
        // When
        viewModel.onAppear()
        
        // Then
        XCTAssertNotNil(viewModel.users)
        XCTAssertEqual(viewModel.users, expectedUsers)
    }
}

// Mock UsersServiceProtocol for testing purposes
class MockUsersService: UsersServiceProtocol {
    var networker: NetworkerProtocol {
        return MockNetworker() // You need to implement MockNetworker for testing
    }
    
    func getUsers() -> AnyPublisher<Users, Error> {
        fatalError("Not implemented for testing")
    }
    
    func getUsers(count: Int) -> AnyPublisher<Users, Error> {
        // Here you can mock the response of your service
        let users = Users(data: [User.fake()])
        return Just(users)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func getSingleUser(id: String) -> AnyPublisher<User, Error> {
        fatalError("Not implemented for testing")
    }
}

// Mock NetworkerProtocol for testing
class MockNetworker: NetworkerProtocol {
    func get<T>(type: T.Type, url: URL, headers: Headers) -> AnyPublisher<T, Error> where T : Decodable {
        fatalError("Not implemented for testing")
    }
    
    func getData(url: URL, headers: Headers) -> AnyPublisher<Data, URLError> {
        fatalError("Not implemented for testing")
    }
}
