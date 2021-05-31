//
//  CartView.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import UIKit

class CartView: UIView {

    let ipAddressTF: UITextField = {
        let tf = UITextField()
        tf.placeholder = "write ip address"
        tf.autocorrectionType = .no
        tf.keyboardType = .decimalPad
        tf.setToolBar()
        return tf
    }()
    
    let connectButton: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "connect"), for: .normal)
        return btn
    }()
    
    let tableView: UITableView = {
        let tv = UITableView()
        tv.register(CartCell.self, forCellReuseIdentifier: "cell")
        tv.tableFooterView = UIView()
        return tv
    }()
    
    let totalPriceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = .boldSystemFont(ofSize: 20)
        return lbl
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        [ipAddressTF, connectButton, tableView, totalPriceLabel].forEach({self.addSubview($0)})
    }
    
    func setupConstraints() {
        connectButton.anchor(top: self.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 0, right: 20), size: .init(width: 30, height: 30))
        ipAddressTF.anchor(top: self.topAnchor, leading: self.leadingAnchor, trailing: connectButton.leadingAnchor, padding: .init(top: 20, left: 20, bottom: 0, right: 10), size: .init(width: 0, height: 30))
        totalPriceLabel.anchor(leading: self.leadingAnchor, bottom: self.safeBottomAnchor, trailing: self.trailingAnchor, padding: .init(top: 0, left: 5, bottom: 10, right: 20), size: .init(width: 0, height: 40))
        tableView.anchor(top: ipAddressTF.bottomAnchor, leading: self.leadingAnchor, bottom: totalPriceLabel.topAnchor, trailing: self.trailingAnchor, padding: .init(top: 20, left: 0, bottom: 10, right: 0))
    }

}
