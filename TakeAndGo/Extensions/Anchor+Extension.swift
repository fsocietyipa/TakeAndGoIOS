//
//  Extension+Anchor.swift
//  tazalyk
//
//  Created by Yerkegali Abubakirov on 11.09.2018.
//  Copyright © 2018 Yerkegali Abubakirov. All rights reserved.
//

import UIKit

extension UIView {
    
    var safeTopAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.topAnchor
        }
        return topAnchor
    }
    
    var safeLeadingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.leadingAnchor
        }
        return leadingAnchor
    }
    
    var safeBottomAnchor: NSLayoutYAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.bottomAnchor
        }
        return bottomAnchor
    }
    
    var safeTrailingAnchor: NSLayoutXAxisAnchor {
        if #available(iOS 11.0, *) {
            return safeAreaLayoutGuide.trailingAnchor
        }
        return trailingAnchor
    }
    
    
    func aspectRatioByWidth(multiplier: CGFloat) {
        self.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: multiplier).isActive = true
    }
    
    func aspectRatioByHeight(multiplier: CGFloat) {
        self.widthAnchor.constraint(equalTo: self.heightAnchor, multiplier: multiplier).isActive = true
    }
    
    func anchor(top: NSLayoutYAxisAnchor? = nil, leading: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, trailing: NSLayoutXAxisAnchor? = nil, padding: UIEdgeInsets = .zero, size: CGSize = .zero) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: padding.top).isActive = true
        }
        
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: padding.left).isActive = true
        }
        
        if let bottom =  bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom).isActive = true
        }
        
        if let trailing  = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -padding.right).isActive = true
        }
        
        if size.width != 0 {
            widthAnchor.constraint(equalToConstant: size.width).isActive = true
        }
        
        if size.height != 0 {
            heightAnchor.constraint(equalToConstant: size.height).isActive = true
        }
    }
    
    func centerAnchor(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerY(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    func centerX(to view: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    func fillSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: superview?.topAnchor, leading: superview?.leadingAnchor, bottom: superview?.bottomAnchor, trailing: superview?.trailingAnchor)
    }
    
    func fillSafeSuperView() {
        translatesAutoresizingMaskIntoConstraints = false
        anchor(top: superview?.safeTopAnchor, leading: superview?.safeLeadingAnchor, bottom: superview?.safeBottomAnchor, trailing: superview?.safeTrailingAnchor)
    }
    
    func anchorSize(width: CGFloat = 0, height: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
    
    func anchorSizeMultiply(view: UIView, multiplierWidth: CGFloat = 0, multiplierHeight: CGFloat = 0) {
        translatesAutoresizingMaskIntoConstraints = false
        if multiplierWidth != 0 {
            widthAnchor.constraint(equalToConstant: view.frame.width/multiplierWidth).isActive = true
        }
        if multiplierHeight != 0 {
            heightAnchor.constraint(equalToConstant: view.frame.height/multiplierHeight).isActive = true
        }
    }
    
    public func removeAllConstraints() {
        var _superview = self.superview
        
        while let superview = _superview {
            for constraint in superview.constraints {
                
                if let first = constraint.firstItem as? UIView, first == self {
                    superview.removeConstraint(constraint)
                }
                
                if let second = constraint.secondItem as? UIView, second == self {
                    superview.removeConstraint(constraint)
                }
            }
            
            _superview = superview.superview
        }
        
        self.removeConstraints(self.constraints)
        self.translatesAutoresizingMaskIntoConstraints = true
    }
    
}
