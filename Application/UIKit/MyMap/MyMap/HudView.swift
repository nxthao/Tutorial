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
        
//        hudView.backgroundColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        return hudView
    }
    
    override func draw(_ rect: CGRect) {
        let boxWidth : CGFloat = 96
        let boxHeigh : CGFloat = 96
        
        let boxRect = CGRect(x: round((bounds.size.width - boxWidth ) / 2), y: round((bounds.size.height - boxHeigh) / 2), width: boxWidth, height: boxHeigh)
        
        let roundedRect = UIBezierPath(roundedRect: boxRect, cornerRadius: 10)
        UIColor(white: 0.3, alpha: 0.8).setFill()
        roundedRect.fill()
        
        if let image = UIImage(named: "CheckMark"){
            let imagePoint = CGPoint(x: center.x - round(image.size.height), y: center.y - round(image.size.width) - boxHeigh / 8)
            image.draw(at: imagePoint)
        }
    }
}
