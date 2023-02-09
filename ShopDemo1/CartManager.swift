//
//  CartManager.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 20/01/23.
//

import Foundation
import SwiftUI

class CartManager : ObservableObject{
    @Published var products : [Product] = []  // private (set) removed
    @Published var total : Int = 0
    @Published var quantity : Int = 0
    @Published var myProducts = [String : Int]()

    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    func addToCart(product : Product){
        products.append(product)
        total += product.price

        print("--------------------------------")
        
        if(myProducts.contains{ $0.key == product.name}){
            quantity = myProducts[product.name]!
            quantity += 1
            myProducts.updateValue(quantity, forKey: product.name)
        } else{
            myProducts.updateValue(1, forKey: product.name)
        }
    }
    
    func removeFromCart(product : Product){

//        products = products.filter{ $0.id != product.id} // it removes all instances of given product
        if let removedProduct = products.firstIndex(where: {$0.id == product.id}){ // this way it only removes one instance
            products.remove(at: removedProduct)
        }
        total -= product.price
        
        if let quantity = myProducts[product.name]{
            if (quantity > 1){
                let q = quantity - 1
                myProducts.updateValue(q, forKey: product.name)
            }else{
                myProducts.removeValue(forKey: product.name)
            }
        }
    }
    
    func pay(){
        paymentHandler.startPayment(products: products, total: total) { success in
            self.paymentSuccess = success
            self.products = [] // reset cart
            self.total = 0
        }
    }
    
}
