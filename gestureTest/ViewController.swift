//
//  ViewController.swift
//  gestureTest
//
//  Created by Grey Patterson on 2017-02-27.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dView: DrawView!
    
    @IBAction func swipeGesture(_ sender: UISwipeGestureRecognizer) {
        print("swipeGesture")
        dView.swipeHandler(sender)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapRecognizer = UITapGestureRecognizer(target: dView, action: #selector(dView.tapHandler(_:)))
        dView.addGestureRecognizer(tapRecognizer)
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: dView, action: #selector(dView.longPressHandler(_:)))
        dView.addGestureRecognizer(longPressRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: dView, action: #selector(dView.pinchHandler(_:)))
        dView.addGestureRecognizer(pinchRecognizer)
        
        let panRecognizer = UIPanGestureRecognizer(target: dView, action: #selector(dView.panHandler(_:)))
        dView.addGestureRecognizer(panRecognizer)
        
        let rotateRecognizer = UIRotationGestureRecognizer(target: dView, action: #selector(dView.rotationHandler(_:)))
        dView.addGestureRecognizer(rotateRecognizer)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

