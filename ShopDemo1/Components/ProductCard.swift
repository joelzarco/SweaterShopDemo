//
//  ProductCard.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 19/01/23.
//

import SwiftUI

struct ProductCard: View {
    @EnvironmentObject var cartManager : CartManager
    var product : Product
    
    var body: some View {
        
        ZStack(alignment : .topTrailing) {
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(20)
                    .frame(width: 180)
                    .scaledToFit()
                
                VStack(alignment: .leading) {
                    Text(product.name)
                        .bold()
                    Text("$\(product.price)")
                        .font(.caption)
                }
                .padding()
                .frame(width: 180, alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            } // ZStack inner
            .frame(width: 180, height: 250)
            .shadow(radius: 3)
            // add to cart button
            Button{
                print("Added to cart")
                cartManager.addToCart(product: product)
            } label: {
                Image(systemName: "plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(50)
                    .padding()
            }
            
        } // outter ZStack
    }
}

//struct ProductCard_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductCard(product: productList[0])
//    }
//}
