//
//  CartViewModel.swift.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import Foundation
import RxSwift
import RxCocoa
import SocketIO

class CartViewModel {
    
    
    let _cartData = BehaviorRelay<CartData?>(value: nil)
    let _totalPrice = BehaviorRelay<Int?>(value: nil)
    
    var cartData: Driver<CartData?> {
        return _cartData.asDriver()
    }
    
    var totalPrice: Driver<Int?> {
        return _totalPrice.asDriver()
    }
    
    var numberOfItemsInCart: Int {
        guard let crtDat = _cartData.value else { return 0 }
        return crtDat.count
    }
    
    let manager = SocketManager(socketURL: URL(string: "http://192.168.1.175")!, config: [.log(false), .compress])
    var socket: SocketIOClient? = nil

    // MARK: - Life Cycle
    init() {
        setupSocket()
        setupSocketEvents()
        socket?.connect()
    }

    func stop() {
        socket?.removeAllHandlers()
    }

    // MARK: - Socket Setups
    func setupSocket() {
        self.socket = manager.defaultSocket
    }

    
    func setupSocketEvents() {

        socket?.on(clientEvent: .connect) {data, ack in
            print("connected")
        }

        socket?.on("cart") { (data, ack) in
            guard let dict = data.first as? [[String: Any]] else { return }
            let resCart = try? CartData(from: dict)
            self._cartData.accept(resCart)
            if let resCart1 = resCart {
                self._totalPrice.accept(resCart1.map{$0.itemPrice}.reduce(0, +))
            }
        }

    }
       
    func viewModelForCell(at index: Int) -> CartCellViewModel? {
        guard let crtDat = _cartData.value else { return nil }
        return CartCellViewModel(item: crtDat[index])
    }
}
