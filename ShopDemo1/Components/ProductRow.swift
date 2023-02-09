//
//  ProductRow.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 20/01/23.
//

import Foundation
import SwiftUI

struct ProductRow : View{
    
    @EnvironmentObject var cartManager : CartManager
    
    var product : Product
    
    var body: some View{
        HStack(spacing: 20) {
            Image(product.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
                .cornerRadius(10)
            
            VStack(alignment: .center, spacing: 10){

                Text("Quantity:")
                    .font(.caption)
                if let q = cartManager.myProducts[product.name]{
                    Text("\(q)")
                        .font(.caption).bold()
                }
            }
            
            
            VStack(alignment: .leading, spacing: 10) {
                Text(product.name)
                    .bold()
                Text("$\(product.price)")
            }
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.pink)
                .onTapGesture {
                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
        
    }
}
