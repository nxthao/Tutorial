//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 12/12/2020.
//

import Foundation

class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult : Codable , CustomStringConvertible {
    var artistName : String? = ""
    var trackName : String? = ""
    
    var name : String{
        return trackName ?? ""
    }
    
    var description: String{
        return "Name : \(name), Artist Name: \(artistName ?? "None")"
    }
}
