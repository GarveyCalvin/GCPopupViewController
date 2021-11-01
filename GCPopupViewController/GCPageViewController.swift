//
//  GCPageViewController.swift
//  SwiftDemo
//
//  Created by GarveyCalvin on 2021/10/30.
//  Copyright © 2021 GarveyCalvin. All rights reserved.
//

import UIKit

class GCPageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: 200, height: 300)
        btn.addTarget(self, action: #selector(ok), for: .touchUpInside)
        btn.center.x = self.view.center.x
        self.view.addSubview(btn)
    }
    
    @objc func ok() {
        print(#file, #line, #function)
    }
    
}
