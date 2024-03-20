//
//  UsersView.swift
//  RetoUsersDetail
//
//  Created by Bruno on 19/03/24.
//

import SwiftUI

struct UsersView: View {
    
    @ObservedObject var viewModel: UsersViewModel
    
    var body: some View {
        NavigationView {
            List(viewModel.users.data) { user in
                
                Text(user.firstName)
                
            }.navigationTitle("Users")
        }.onAppear(perform: {
            viewModel.onAppear()
        })
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView(viewModel: UsersViewModel())
    }
}
