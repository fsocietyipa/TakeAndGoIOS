//
//  CartData.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import Foundation

//struct CartData: Codable {
//    var totalPrice: Int
//    var shoppingCart: [Item]
//}

typealias CartData = [Item]


struct Item: Codable {
    let itemName: String
    let itemPrice, itemWeight, count: Int
}
