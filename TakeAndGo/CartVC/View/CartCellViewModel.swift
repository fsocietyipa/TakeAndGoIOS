//
//  CartCellViewModel.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import Foundation

class CartCellViewModel {
    private var item: Item
    
    var name: String {
        return item.itemName
    }
    var weight: String {
        return "\(item.itemWeight) грамм"
    }
    
    var count: String {
        return String(item.count)
    }
    var price: String {
        return "\(item.itemPrice) тг"
    }

    init(item: Item) {
        self.item = item
    }
}
