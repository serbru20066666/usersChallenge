import SwiftUI

struct UserDetailView: View {
    @ObservedObject var viewModel: UserDetailViewModel
    
    let screenWidth = UIScreen.main.bounds.width
    
    var body: some View {
        VStack {
            Image(uiImage: viewModel.avatar)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: screenWidth * 0.2,
                       height: screenWidth * 0.2,
                       alignment: .center)
                .clipShape(Circle())
                .shadow(radius: 10)
                .overlay(Circle().stroke(Color.blue, lineWidth: 3))
                .padding()
                
            HStack {
                Text(viewModel.user.firstName)
                Text(viewModel.user.lastName)
            }
            VStack(alignment: .leading, spacing: 20) {
                Text("ID: \(viewModel.user.id ?? "N/A")")
                Text("Full Name: \(viewModel.user.firstName) \(viewModel.user.lastName)")
                Text("Email: \(viewModel.user.email ?? "N/A")")
                Text("Registration Date: \(viewModel.user.registerDate ?? "N/A")")
                Text("Phone: \(viewModel.user.phone ?? "N/A")")
            }
            Spacer()
        }
        .navigationTitle(viewModel.user.firstName)
        .onAppear(perform: {
            self.viewModel.onAppear()
        })
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView(
            viewModel: UserDetailViewModel(
                user: User.fake()
            )
        )
    }
}

