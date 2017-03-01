//
//  drawView.swift
//  gestureTest
//
//  Created by Grey Patterson on 2017-02-27.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

@IBDesignable class DrawView: UIView{
    
    @IBInspectable var scale: CGFloat = 100.0 {
        didSet{
            setNeedsDisplay();
        }
    }
    
    var small = true
    
    // One-finger gestures
    func tapHandler(_ tapRecognizer: UITapGestureRecognizer){
        print("tapHandler()")
        if(small){
            scale *= 2
        }else{
            scale *= 0.5
        }
        small = !small
    }
    
    // One-finger continuous gestures
    func longPressHandler(_ longPressRecognizer: UILongPressGestureRecognizer){ // long press resets it
        switch longPressRecognizer.state{
        case .ended, .changed:
            scale = 100
            self.transform = CGAffineTransform.identity
        default:
            break;
        }
    }
    func panHandler(_ panRecognizer: UIPanGestureRecognizer){ // heh
        switch panRecognizer.state{
        case .changed, .ended:
            let transformation = panRecognizer.translation(in: self)
            self.transform = self.transform.translatedBy(x: transformation.x, y: transformation.y)
            self.transform = CGAffineTransform.identity
        default:
            break;
        }
    }
    func swipeHandler(_ swipeRecognizer: UISwipeGestureRecognizer){
        print("swipe")
        if swipeRecognizer.state == .ended{
            switch swipeRecognizer.direction {
            case UISwipeGestureRecognizerDirection.up, UISwipeGestureRecognizerDirection.right:
                print("swiped up or right")
                scale *= 1.2
            default:
                print("swiped down or left")
                scale *= 1/1.2
            }
        }
    }
    
    // Two-finger continuous gestures
    func pinchHandler(_ pinchRecognizer: UIPinchGestureRecognizer){
        if pinchRecognizer.state == .changed{
            scale *= pinchRecognizer.scale
            pinchRecognizer.scale = 1
        }
    }
    
    func rotationHandler(_ rotationRecognizer: UIRotationGestureRecognizer){
        print("rotation") // eventually we may actually rotate things
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
