//
//  Product.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 19/01/23.
//

import Foundation

struct Product : Identifiable, Hashable{
    
    var id = UUID()
    var name : String
    var image : String
    var price : Int
    
}


var productList = [Product(name: "Rainbow ", image: "sweater1", price: 29),
                   Product(name: "Olive fall", image: "sweater2", price: 39),
                   Product(name: "Christmas green", image: "sweater3", price: 59),
                   Product(name: "Beach White", image: "sweater4", price: 69),
                   Product(name: "College red", image: "sweater5", price: 79),
                   Product(name: "Fall copper", image: "sweater6", price: 89),
                   Product(name: "Morning sky", image: "sweater7", price: 99),
                   Product(name: "Sweet orange", image: "sweater8", price: 19)
]
