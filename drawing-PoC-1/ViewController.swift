//
//  ViewController.swift
//  drawing-PoC-1
//
//  Created by Will on 22/8/19.
//  Copyright © 2019 Will. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var canvasView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let drawView: DrawView = DrawView(frame: CGRect(x: 0, y: 0, width: canvasView.frame.width, height: canvasView.frame.height))
        drawView.backgroundColor = UIColor.clear
        
        canvasView.backgroundColor = .white
        canvasView.addSubview(drawView)
    }


}

