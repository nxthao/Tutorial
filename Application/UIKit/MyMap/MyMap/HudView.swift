//
//  HudView.swift
//  MyMap
//
//  Created by Thao Nguyen on 11/4/20.
//

import UIKit

class HudView : UIView{
    var text = ""
    class func hud(inView view : UIView, animated : Bool) -> HudView{
        let hudView = HudView(frame: view.bounds)
        hudView.isOpaque = false
        
        view.isUserInteractionEnabled = false
        view.addSubview(hudView)
        
        hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        return hudView
    }
}
