//
//  ViewController.swift
//  mpersand
//
//  Created by 정윤서 on 2023/05/02.
//

import UIKit

final class SearchUserIdViewController: BaseViewController {
    
    // MARK: Properties
    var userIdArr: [String] = ["고구마", "정민서", "자몽", "정윤서", "감자"]
    var filterArr: [String] = []
    
    lazy var tableView = UITableView(frame: .zero, style: .plain)
    
    var isFiltering: Bool {
        let searchController = self.navigationItem.searchController
        let isActive = searchController?.isActive ?? false
        let isSearchBarHasText = searchController?.searchBar.text?.isEmpty == false
        return isActive && isSearchBarHasText
    }
    
    // MARK: Funtions
    func setupSearchController() {
        let search = UISearchController(searchResultsController: nil)
        search.searchBar.placeholder = "Search User"
        search.hidesNavigationBarDuringPresentation = false
        search.searchResultsUpdater = self
        
        self.navigationItem.searchController = search
        self.navigationItem.title = "유저 검색"
        self.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSearchController()
        self.tableView.dataSource = self
    }
    
    override func addViews() {
        view.addSubViews(tableView)
    }
    
    override func setLayout() {
        func tableviewConstraints() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate( [
                self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
                self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
                self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                self.tableView.trailingAnchor.constraint(equalTo: self.tableView.safeAreaLayoutGuide.trailingAnchor)
            ])
        }
    }
}

// MARK: extensions
extension SearchUserIdViewController: UITableViewDelegate, UITableViewDataSource {

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.isFiltering ? self.filterArr.count : self.userIdArr.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        
        if self.isFiltering {
            cell.textLabel?.text = self.filterArr[indexPath.row]
        } else {
            cell.textLabel?.text = self.userIdArr[indexPath.row]
        }
        
        return cell
    }
}

extension SearchUserIdViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text?.lowercased() else { return }
        self.filterArr = self.userIdArr.filter{ $0.localizedCaseInsensitiveContains(text)}
        
        self.tableView.reloadData()
    }
}
