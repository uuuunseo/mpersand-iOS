//
//  BaseViewController.swift
//  mpersand
//
//  Created by 정윤서 on 2023/05/02.
//

import Foundation
import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        addViews()
        setLayout()
        configNavigation()
    }
    
    func addViews() {}
    func setLayout() {}
    func configNavigation(){}
}
