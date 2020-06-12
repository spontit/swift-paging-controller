//
//  ViewController.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private var menuBarVC : MenuBarViewController!
    private var controllers : [UIViewController] = []
    private var controllerTitles : [String] = []
    private var menuBarView : UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    init(controllers : [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.controllers = controllers
        for con in controllers {
            self.controllerTitles.append(con.title ?? " ")
        }
        self.view = self.controllers[0].view
        self.menuBarVC = MenuBarViewController(titles: self.controllerTitles)
        self.addChild(self.menuBarVC)
        self.menuBarView = self.menuBarVC.collectionView
        self.menuBarView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        self.menuBarView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.menuBarView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

