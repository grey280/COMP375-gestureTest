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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let tapRecognizer = UITapGestureRecognizer(target: dView, action: #selector(dView.tapHandler(_:)))
        dView.addGestureRecognizer(tapRecognizer)
        print("Added gesture recognizer")
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: dView, action: #selector(dView.longPressHandler(_:)))
        dView.addGestureRecognizer(longPressRecognizer)
        print("Added long press recognizer")
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: dView, action: #selector(dView.pinchHandler(_:)))
        dView.addGestureRecognizer(pinchRecognizer)
        print("Added pinch recognizer")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

