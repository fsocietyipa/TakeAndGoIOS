//
//  CartCell.swift
//  TakeAndGo
//
//  Created by fsociety.3 on 10/22/20.
//

import UIKit

class CartCell: UITableViewCell {


    let itemNameLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .boldSystemFont(ofSize: 15)
        lbl.numberOfLines = 4
        return lbl
    }()
    
    let weightLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .left
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    let countLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .center
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    let priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.textAlignment = .right
        lbl.font = .systemFont(ofSize: 14)
        return lbl
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        [itemNameLabel, weightLabel, countLabel, priceLabel].forEach({contentView.addSubview($0)})
    }
    
    func setupConstraints() {
        itemNameLabel.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 15, left: 20, bottom: 0, right: 20))
        itemNameLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true
        weightLabel.anchor(top: itemNameLabel.bottomAnchor, leading: contentView.leadingAnchor, bottom: contentView.bottomAnchor, padding: .init(top: 5, left: 20, bottom: 15, right: 0), size: .init(width: 0, height: 20))
        priceLabel.anchor(top: itemNameLabel.bottomAnchor, bottom: contentView.bottomAnchor, trailing: contentView.trailingAnchor, padding: .init(top: 5, left: 0, bottom: 15, right: 20), size: .init(width: 0, height: 20))
        countLabel.anchor(top: itemNameLabel.bottomAnchor, bottom: contentView.bottomAnchor, trailing: priceLabel.leadingAnchor, padding: .init(top: 5, left: 0, bottom: 15, right: 20), size: .init(width: 0, height: 20))
        [weightLabel, priceLabel, countLabel].forEach({$0.widthAnchor.constraint(greaterThanOrEqualToConstant: 20).isActive = true})
    }
    
}
