//
//  LoginView.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Header(title: "iTodo", subtitle: "Get things done", angle: -15, background: Color.orange)
                
                Form {
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    SecureField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    Button {
                        viewModel.login()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.orange)
                            
                            Text("Log In")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                }
                .offset(y: -25)
                .scrollContentBackground(.hidden)
                .background(Color(UIColor.systemBackground))
            
                VStack {
                    Text("New around here?")
                    NavigationLink("Create an account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Incorrect data"), message: Text(viewModel.error ), dismissButton: .default(Text("OK")))
        }
        .onReceive(viewModel.$error) { error in
            if !error.isEmpty {
                showAlert = true
            }
        }
    }
}

#Preview {
    LoginView()
}
