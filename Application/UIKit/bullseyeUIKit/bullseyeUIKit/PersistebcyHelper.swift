//
//  PersistebcyHelper.swift
//  bullseyeUIKit
//
//  Created by Thao Nguyen on 10/12/20.
//

import Foundation

func dataFilePath() -> URL{
    let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
    return paths[0].appendingPathComponent("HighScores.plist")
}


