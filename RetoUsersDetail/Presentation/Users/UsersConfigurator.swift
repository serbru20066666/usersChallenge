import Foundation

final class UsersConfigurator {
    
    public static func configureUsersView() -> UsersView {
        return UsersView(viewModel: UsersViewModel())
    }
}
