//
//  ViewController.swift
//  gestureTest
//
//  Created by Grey Patterson on 2017-02-27.
//  Copyright © 2017 Grey Patterson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var dView: drawView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(dView.tapHandler))
        dView.addGestureRecognizer(tapRecognizer)
        print("Added gesture recognizer")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

