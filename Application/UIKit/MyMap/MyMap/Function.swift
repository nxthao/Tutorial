//
//  Function.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/6/20.
//

import Foundation

func afterDelay(_ seconds: Double, run : @escaping () -> Void){
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds, execute: run)
}
