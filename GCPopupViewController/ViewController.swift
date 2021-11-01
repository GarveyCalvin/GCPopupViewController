//
//  ViewController.swift
//  GCPopupViewController
//
//  Created by GarveyCalvin on 2021/10/30.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btn = UIButton(type: .system)
        btn.setTitle("Click Me", for: .normal)
        btn.frame = CGRect(x: 30, y: 80, width: 60, height: 30)
        btn.addTarget(self, action: #selector(present2), for: .touchUpInside)
        self.view.addSubview(btn)
    }
    
    @objc func present2() {
        let vc = GCBaseUIController()
        self.gc_presentPopupViewController(popupViewController: vc, animationType: .fade)
        vc.dismissBlock = {
            self.gc_dismissPopupViewController(animationType: .fade)
        }
//        present3()
    }
    
    func present3() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let vc = GCPageViewController()
            self.gc_presentPopupViewController(popupViewController: vc, animationType: .fade)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 15) {
            self.gc_dismissPopupViewController(animationType: .fade)
        }
    }

}

