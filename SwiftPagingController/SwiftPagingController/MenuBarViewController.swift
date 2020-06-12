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
    
    static let ITEM_HEIGHT : CGFloat = 50
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .lightGray
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.register(MenuBarItemCell.self, forCellWithReuseIdentifier: cellId)
        self.collectionView.isPagingEnabled = true
        self.collectionView.isScrollEnabled = true
    }
    
    init(titles: [String]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
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
        let width = self.titles[indexPath.row].widthOfString(usingFont: UIFont.systemFont(ofSize: 16))
        
        return CGSize(width: width + MenuBarItemCell.SIDE_PADDING * 2, height: MenuBarViewController.ITEM_HEIGHT)
    }
    
    
}

