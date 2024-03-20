import Foundation
import Combine

class UsersViewModel: ObservableObject {
    @Published public var users: Users = Users(data: [])
    @Published public var isLoading: Bool = false // Track loading state

    private var usersService: UsersServiceProtocol
    private var cancellables = Set<AnyCancellable>()

    init(usersService: UsersServiceProtocol = UsersService()) {
        self.usersService = usersService
    }

    public func onAppear() {
        isLoading = true // Set loading state to true
        getUsers(count: 40)
    }

    private func getUsers(count: Int) {
        usersService.getUsers(count: count)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false // Set loading state to false after completion
                switch completion {
                case .failure(let error):
                    print(error)
                case .finished: break
                }
            } receiveValue: { [weak self] users in
                self?.users = users
            }
            .store(in: &cancellables)
    }
}

