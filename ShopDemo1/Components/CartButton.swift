//
//  CartButton.swift
//  ShopDemo1
//
//  Created by Johel Zarco on 20/01/23.
//

import SwiftUI

struct CartButton: View {
    
    var numberOfProducts : Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image(systemName: "cart") // from SFSymbols
                .padding(.top, 4)
            if(numberOfProducts > 0){
                Text("\(numberOfProducts)")
                    .font(.caption2).bold()
                    .foregroundColor(.white)
                    .frame(width: 15, height: 15)
                    .background(.pink)
                    .cornerRadius(50) // full circle
            }
        }
    }
}

//struct CartButton_Previews: PreviewProvider {
//    static var previews: some View {
//        CartButton()
//    }
//}
