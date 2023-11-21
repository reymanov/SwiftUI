//
//  RegisterView.swift
//  ITodo
//
//  Created by Kuba Rejmann on 27/09/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            VStack {
                Header(title: "Register", subtitle: "And start doing!", angle: -15, background: Color.orange)
                
                Form {
                    TextField("Name", text: $viewModel.name)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField("Email", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TextField("Password", text: $viewModel.password)
                        .textFieldStyle(DefaultTextFieldStyle())
                    Button {
                        viewModel.register()
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(Color.orange)
                            
                            Text("Create Account")
                                .foregroundColor(Color.white)
                                .bold()
                        }
                    }
                    .padding(.top, 16)
                    .padding(.bottom, 16)
                }
                .offset(y: -50)
                .scrollContentBackground(.hidden)
                .background(Color(UIColor.systemBackground))
                
                
                VStack {
                    Text("Already have an account?")
                    NavigationLink("Log in", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                Spacer()
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
}

#Preview {
    RegisterView()
}
