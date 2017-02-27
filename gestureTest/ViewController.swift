//
//  ViewController.swift
//  gestureTest
//
//  Created by Grey Patterson on 2017-02-27.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var gestureView: GestureView!{
        didSet{
            let tapHandler = #selector(drawView.tapHandler(tapGestureRecognizer:))
            let tapGestureRecognizer = UITapGestureRecognizer(target: gestureView, action: tapHandler)
            gestureView.addGestureRecognizer(tapGestureRecognizer)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

