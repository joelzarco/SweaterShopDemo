//
//  SweaterDetailView.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 25/01/23.
//

import SwiftUI

struct SweaterDetailView: View {
    
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    
    var body: some View {
        ZStack(alignment: .topTrailing ) {
            
            VStack{
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .scaledToFit()
                    .padding()
                Text("Price: $\(product.price).00")
                    .font(.title).bold()
                    .foregroundColor(.primary)
                    .padding([.top, .bottom])
            } // VS
            .navigationTitle("\(product.name) Sweater")
            .toolbar {
                NavigationLink{
                    // destination of link
                    CartView()
                        .environmentObject(cartManager)
                }label: {
                    // origin of link
                    CartButton(numberOfProducts: cartManager.products.count)
                }
            } // toolbar
            Button{
//                print("Added to cart from detail")
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
        } // Zs
    }
}


