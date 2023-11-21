//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Kuba Rejmann on 21/03/2023.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var order: Order
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Name", text: $order.name)
                    TextField("Street adress", text: $order.streetAdress)
                    TextField("City", text: $order.city)
                    TextField("Zip Code", text: $order.zip)
                }
                
                Section {
                    NavigationLink {
                        CheckoutView(order: order)
                    } label: {
                        Text("Check out")
                    }
                    .disabled(!order.hasValidAdress)
                }
            }
            .navigationTitle("Delivery details")
        }
    }
    
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        AddressView(order: Order())
    }
}
