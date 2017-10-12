//
//  ViewController.swift
//  DashBoard
//
//  Created by ChungTran on 10/2/17.
//  Copyright © 2017 ChungTran. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var speed: Float = 0.0
    @IBOutlet weak var dashBoard: GaugeView!
    override func viewDidLoad() {
        super.viewDidLoad()
        dashBoard.updateSpeed(value: speed)
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func startDashBoard(_ sender: Any) {
        speed += 0.1
        print(speed)
        if speed > 1.1 {
            speed = 0.0
        }
        dashBoard.updateSpeed(value: speed)
    }
    
}

