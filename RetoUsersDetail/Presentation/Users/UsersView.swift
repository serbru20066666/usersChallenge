import SwiftUI

struct UsersView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users.data) { user in
                NavigationLink(
                    destination: UsersRouter.destinationForTappedUser(user: user)
                ) {
                    Text(user.firstName)
                }
            }
            .navigationTitle("Users")
            .onAppear {
                viewModel.onAppear()
            }
        }
        .overlay(
            ProgressView("Loading Users...")
                .opacity(viewModel.isLoading ? 1 : 0) // Hide when data is loaded
        )
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: UsersViewModel())
    }
}
