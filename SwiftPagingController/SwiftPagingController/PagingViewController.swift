//
//  PagingViewController.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class PagingViewController : UIViewController {
    
    private var menuBarVC : MenuBarViewController!
    private var paginatedVC : PaginatedViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    init(controllers : [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        var controllerTitles : [String] = []
        for con in controllers {
            controllerTitles.append(con.title ?? " ")
        }
        self.view.addSubview(controllers[0].view)
        self.menuBarVC = MenuBarViewController(titles: controllerTitles)
        self.addChild(self.menuBarVC)
        self.paginatedVC = PaginatedViewController(controllers: controllers)
        self.menuBarVC.paginatedVC = self.paginatedVC
        self.addChild(self.paginatedVC)
        self.view.addSubview(self.menuBarVC.collectionView)
        self.view.addSubview(self.paginatedVC.collectionView)
        self.menuBarVC.collectionView.heightAnchor.constraint(equalToConstant: MenuBarViewController.ITEM_HEIGHT).isActive = true
        self.menuBarVC.collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.menuBarVC.collectionView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
        self.paginatedVC.collectionView.topAnchor.constraint(equalTo: self.menuBarVC.collectionView.bottomAnchor).isActive = true
        self.paginatedVC.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        self.paginatedVC.collectionView.widthAnchor.constraint(equalToConstant: self.view.frame.width).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
