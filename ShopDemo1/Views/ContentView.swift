//
//  ContentView.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 19/01/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var cartManager = CartManager()
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    
    var body: some View {
        
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(productList, id: \.id){ product in
                        NavigationLink{
                            SweaterDetailView(product: product)
                                .environmentObject(cartManager)
                        } label: {
                            ProductCard(product: product)
                                .environmentObject(cartManager)
                        }
                        
                    } //forE
                } // lazyV
                .padding()
            } // scrollV
            .navigationTitle("Sweater shop")
            .toolbar {
                NavigationLink{
                    // destination of link
                    CartView()
                        .environmentObject(cartManager)
                }label: {
                    // origin of link
                    CartButton(numberOfProducts: cartManager.products.count)
                }
                
            }
        } //Nav
//        .navigationViewStyle(StackNavigationViewStyle()) // will be soon deprecated and no longer firing warnings
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView()
//    }
//}
