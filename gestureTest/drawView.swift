//
//  drawView.swift
//  gestureTest
//
//  Created by Grey Patterson on 2017-02-27.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

@IBDesignable class drawView: UIView{
    
    @IBInspectable var scale: CGFloat = 100.0 {
        didSet{
            setNeedsDisplay();
        }
    }
    
    var small = true
    func tapHandler(tapGestureRecognizer: UITapGestureRecognizer){
        if(small){
            scale *= 2
        }else{
            scale *= 0.5
        }
        small = !small
    }
    
    override func draw(_ rect: CGRect){
        let center = CGPoint(x: bounds.midX, y:bounds.midY)
        
        let path = UIBezierPath()
        path.move(to: CGPoint(x: center.x, y:center.y-scale))
        path.addLine(to:CGPoint(x: center.x + scale, y:center.y + scale))
        path.addLine(to:CGPoint(x: center.x-scale, y:center.y+scale))
        path.close()
        
        UIColor.red.setStroke()
        UIColor.green.setFill()
        
        path.stroke()
        path.fill()
    }
}
