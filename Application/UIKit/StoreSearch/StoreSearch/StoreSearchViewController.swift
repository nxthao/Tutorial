//
//  StoreSearchViewController.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 02/12/2020.
//

import UIKit

class StoreSearchViewController: UIViewController {

    // MARK: - Outlet variable
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
    }
}

extension StoreSearchViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("The search text is '\(searchBar.text!)'")
    }
}
