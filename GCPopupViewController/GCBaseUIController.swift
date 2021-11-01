//
//  GCBaseUIController.swift
//  SwiftDemo
//
//  Created by GarveyCalvin on 2021/10/8.
//  Copyright © 2021 GarveyCalvin. All rights reserved.
//

import UIKit

class GCBaseUIController: UIViewController {
    
    var dismissBlock: (() -> ())?
    
    private lazy var restoreLabel: UILabel = {
        var label = UILabel()
        label.text = "恢复内购"
        return label
    }()
    
    private lazy var restoreBtn: UIButton = {
        var btn = UIButton(type: .system)
        btn.setAttributedTitle(NSAttributedString(string: " 恢复内购", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)]), for: .normal)
        btn.addTarget(self, action: #selector(restore), for: .touchUpInside)
        btn.sizeToFit()
        btn.center = self.view.center
        return btn
    }()
    
    private lazy var normalBtn: UIButton = {
        var btn = UIButton(type: .custom)
        btn.setTitleColor(UIColor.gray, for: .normal)
        btn.setTitle("Normal", for: .normal)
        btn.sizeToFit()
        btn.center = restoreBtn.center
        btn.frame.origin.y += restoreBtn.frame.height
        return btn
    }()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        print(#file, #line, #function)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.75)
        
        let btn = UIButton(type: .system)
        btn.setTitle("", for: .normal)
        btn.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        btn.addTarget(self, action: #selector(back), for: .touchUpInside)
        view.addSubview(btn)
        
        view.addSubview(restoreBtn)
        view.addSubview(normalBtn)
    }
    
    @objc func back() {
        dismissBlock?()
    }
    
    @objc func restore() {
        print(#file, #line, #function)
    }

}
