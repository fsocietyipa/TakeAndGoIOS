//
//  UITextField+Extension.swift
//  Tazalyk
//
//  Created by fsociety.1 on 8/30/20.
//  Copyright © 2020 fsociety.1. All rights reserved.
//

import UIKit

private var __maxLengths = [UITextField: Int]()

extension UITextField {
    func setToolBar() {
        let toolBar = UIToolbar(frame:CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 50))
        toolBar.barStyle = .default
        let flexibleSpace =  UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Готово", style: .plain, target: self, action: #selector(donePressed))
        toolBar.items = [flexibleSpace, doneButton]
        toolBar.sizeToFit()
        self.inputAccessoryView = toolBar
    }
    
    @objc func donePressed() {
        superview?.endEditing(true)
    }
}

