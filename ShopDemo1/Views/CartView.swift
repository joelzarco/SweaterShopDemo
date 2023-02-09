//
//  CartView.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 20/01/23.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager : CartManager
    
    var body: some View {
        ScrollView{
            if(cartManager.paymentSuccess){
                //
                Text("Thanks for your purchase")
                    .padding()
            }
            else{
                if(cartManager.products.count > 0 && !cartManager.myProducts.isEmpty){
                    // previously used but could not handle multiple quantities
//                    ForEach(cartManager.products, id: \.id){ product in
//                        ProductRow(product: product)
//                    }
//                    products.firstIndex(where: {$0.id == product.id})
                    ForEach(cartManager.myProducts.sorted(by: >), id: \.key){ key, value in
                        let myProduct = cartManager.products.first(where: {$0.name == key})
                        if let mySweater = myProduct{
                            ProductRow(product: mySweater) // we've already made sure cart is not empty
                        }
                    }
  
                    HStack{
                        Text("Your cart total is: ")
                        Spacer()
                        Text("$\(cartManager.total).00")
                            .bold()
                    }
                    .padding()
                    PaymentButton(action: cartManager.pay)
                        .padding()
                    
                } else{
                    Text("Your cart is empty")
                }
            } // outter if
        } // Scr
        .navigationTitle(Text("My cart"))
        .padding(.top)
        .onDisappear{
            if(cartManager.paymentSuccess) {
                cartManager.paymentSuccess = false
            }
        }
    } //someV
}

//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//    }
//}
