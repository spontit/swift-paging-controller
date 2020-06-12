//
//  MenuBarViewController.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class MenuBarViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var titles : [String] = []
    
    static let ITEM_WIDTH : CGFloat = 80
    static let ITEM_HEIGHT : CGFloat = 50
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = .lightGray
        collectionView.register(MenuBarItemCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.heightAnchor.constraint(equalToConstant: MenuBarViewController.ITEM_HEIGHT).isActive = true
        self.view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        collectionView.isPagingEnabled = true
        collectionView.isScrollEnabled = true
    }
    
    init(titles: [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        self.titles = titles
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuBarItemCell
        cell.title.text = self.titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: MenuBarViewController.ITEM_WIDTH, height: MenuBarViewController.ITEM_HEIGHT)
    }
    
    
    
}
