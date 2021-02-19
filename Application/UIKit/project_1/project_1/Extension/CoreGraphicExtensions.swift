//
//  CoreGraphicExtensions.swift
//  project_1
//
//  Created by Thao Nguyen on 19/02/2021.
//

import CoreGraphics

extension CGSize{
    var cgPoint: CGPoint{
        return CGPoint(x: width, y: height)
    }
}

extension CGPoint{
    var cgSize: CGSize{
        return CGSize(width: x, height: y)
    }
}
