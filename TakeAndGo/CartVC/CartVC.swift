//
//  CartVC.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import UIKit
import RxSwift

class CartVC: UIViewController {

    let cartView = CartView()
    
    let viewModel = CartViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        title = "Корзина"
        setupViews()
        setupConstraints()
        setDelegates()
        setViewModel()
        setActions()
    }
    
    func setDelegates() {
        cartView.tableView.delegate = self
        cartView.tableView.dataSource = self
    }
    
    func setViewModel() {
        viewModel.totalPrice.drive (onNext: { (totalPrice) in
            guard let totalPrice = totalPrice else { return }
            self.cartView.totalPriceLabel.text = "Итого: \(totalPrice)₸"
        }).disposed(by: disposeBag)
        viewModel.cartData.drive (onNext: { (_) in
            self.cartView.tableView.reloadData()
        }).disposed(by: disposeBag)
    }
    
    func setActions() {
        cartView.connectButton.addTarget(self, action: #selector(connectPressed), for: .touchUpInside)
    }
    
    @objc func connectPressed() {
        guard let ipAddress = cartView.ipAddressTF.text else { return }
//        viewModel.connectToSocket(ipAddress: ipAddress)
    }
    
    func setupViews() {
        [cartView].forEach({view.addSubview($0)})
    }
    
    func setupConstraints() {
        cartView.fillSafeSuperView()
    }
 

}

extension CartVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItemsInCart
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CartCell
        if let cellViewModel = viewModel.viewModelForCell(at: indexPath.row) {
            cell.itemNameLabel.text = cellViewModel.name
            cell.weightLabel.text = cellViewModel.weight
            cell.countLabel.text = cellViewModel.count
            cell.priceLabel.text = cellViewModel.price
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
