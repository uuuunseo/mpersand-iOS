//
//  UIView+addSubviews.swift
//  mpersand
//
//  Created by 정윤서 on 2023/05/03.
//

import Foundation
import UIKit

extension UIView {
    func addSubViews(_ subview: UIView...) {
        subview.forEach(addSubview(_:))
    }
}
