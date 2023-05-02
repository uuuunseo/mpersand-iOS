//
//  ViewController.swift
//  mpersand
//
//  Created by 정윤서 on 2023/05/02.
//

import UIKit

class ViewController: BaseViewController {
    
    let searchController: UISearchController = {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search User"
        return search
    }()
    
    override func configNavigation() {
        self.navigationItem.searchController = searchController
        self.navigationItem.title = "유저 검색"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
}
