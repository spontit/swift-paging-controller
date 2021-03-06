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
    static let LEFT_INSET_PADDING : CGFloat = -30
    
    var paginatedVC : PaginatedViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .gray
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.register(MenuBarItemCell.self, forCellWithReuseIdentifier: Constants.MENU_BAR_ITEM_CELL)
        self.collectionView.selectItem(at: IndexPath(row: 0, section: 0), animated: false, scrollPosition: .centeredHorizontally)
        self.collectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: MenuBarViewController.LEFT_INSET_PADDING)
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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.MENU_BAR_ITEM_CELL, for: indexPath) as! MenuBarItemCell
        cell.title.text = self.titles[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.titles[indexPath.row].widthOfString(usingFont: UIFont.systemFont(ofSize: 16)) + MenuBarItemCell.SIDE_PADDING * 2
        
        return CGSize(width: width < 100 ? 100 : width, height: MenuBarViewController.ITEM_HEIGHT)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.paginatedVC.collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }
    
    
}

