//
//  UserDetailViewModelTest.swift
//  RetoUsersDetailTests
//
//  Created by BrunoBCP on 19/03/24.
//

import XCTest
import Combine
@testable import RetoUsersDetail

class UserDetailViewModelTests: XCTestCase {
    
    var viewModel: UserDetailViewModel!
    var mockService: MockUserPictureService!
    var cancellables = Set<AnyCancellable>()
    
    override func setUp() {
        super.setUp()
        let user = User(id: "1",
                        title: "Mr",
                        firstName: "John",
                        lastName: "Doe",
                        email: "john@example.com",
                        dateOfBirth: "1980-01-01",
                        registerDate: "2022-01-01",
                        phone: "+1234567890",
                        picture: nil)
        mockService = MockUserPictureService()
        viewModel = UserDetailViewModel(user: user, userPictureService: mockService)
    }
    
    override func tearDown() {
        viewModel = nil
        mockService = nil
        super.tearDown()
    }
    
    func testGetAvatarDataWhenPictureURLDoesNotExist() {
        // Given
        let user = viewModel.user
        
        // When
        viewModel = UserDetailViewModel(user: user, userPictureService: mockService)
        viewModel.onAppear()
        
        // Then
        XCTAssertTrue(viewModel.avatar.isEqual(UIImage()), "Avatar should be the default image")
    }
}

class MockUserPictureService: UserPictureServiceProtocol {
    var networker: NetworkerProtocol {
        return MockNetworker()
    }
    
    var expectedData: Data?
    
    func getUserAvatarData(urlString: String) -> AnyPublisher<Data, Error> {
        guard let data = expectedData else {
            return Fail(error: URLError(.badServerResponse)).eraseToAnyPublisher()
        }
        return Just(data)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
