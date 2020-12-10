//
//  StoreSearchViewController.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 02/12/2020.
//

import UIKit

class StoreSearchViewController: UIViewController {

    // Store content from keyboard.
    struct SearchResult {
        var name : String = ""
        var artistName : String = ""
    }

    // MARK: - Outlet variable
    @IBOutlet weak var searchBar : UISearchBar!
    @IBOutlet weak var tableView : UITableView!    
    // Variable
    var searchResults = [SearchResult]()
    // Search flag
    var hasSearch = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.contentInset = UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0)
        var cellNib = UINib(nibName: TableView.CellIdentifiers.searchResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.searchResultCell)
        
        // Nothing found cell
        cellNib = UINib(nibName: TableView.CellIdentifiers.nothingResultCell, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: TableView.CellIdentifiers.nothingResultCell)
        
        searchBar.becomeFirstResponder()
    }
    
    struct TableView {
        struct CellIdentifiers {
            static let searchResultCell = "SearchResultCell"
            static let nothingResultCell = "NothingFoundCell"
        }
    }
    
    // MARK: - Helper Methods
    func iTunesURL(searchText : String) -> URL{
        let encodedText = searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
        let urlString = String(format: "https://itumes.apple.com/search?term=%@", encodedText)
        let url = URL(string: urlString)
        return url!
    }
}

extension StoreSearchViewController : UISearchBarDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if !searchBar.text!.isEmpty{
            searchBar.resignFirstResponder()
            
            hasSearch = true
            searchResults = []
            
            let url = iTunesURL(searchText: searchBar.text!)
            print("URL: '\(url)'")
            tableView.reloadData()
        }
    }
    
    // Extend the status bar area to the top.
    func position(for bar : UIBarPositioning) -> UIBarPosition{
        return .topAttached
    }
}

extension StoreSearchViewController : UITableViewDelegate , UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !hasSearch {
            return 0
        }
        else if searchResults.count == 0{
            return 1
        }
        else{
            return searchResults.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if searchResults.count == 0{
            return tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.nothingResultCell, for: indexPath)
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: TableView.CellIdentifiers.searchResultCell, for: indexPath) as! SearchResultCell
            let searchResult = searchResults[indexPath.row]
            cell.nameLabel.text = searchResult.name
            cell.artistNameLabel.text = searchResult.artistName
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if searchResults.count == 0{
            return nil
        }
        else{
            return indexPath
        }
    }
}
