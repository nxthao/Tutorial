//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Thao Nguyen on 12/12/2020.
//

import Foundation

var trackPrice : Double? = 0.0
var currency = ""
var artworkUrl60 = ""
var artworkUrl100 = ""
var trackViewUrl : String? = ""
var primaryGenreName = ""

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
