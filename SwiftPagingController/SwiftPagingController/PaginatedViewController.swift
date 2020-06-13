//
//  PaginatedViewController.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class PaginatedViewController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    private var controllers : [UIViewController] = []
    
    var menuBar : MenuBarViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.collectionView.register(PaginatedItemCell.self, forCellWithReuseIdentifier: Constants.PAGINATED_ITEM_CELL)
        self.collectionView.allowsSelection = false
        self.collectionView.isScrollEnabled = true
        self.collectionView.isPagingEnabled = true
    }
    
    init(controllers: [UIViewController]) {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
        self.controllers = controllers
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.controllers.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.PAGINATED_ITEM_CELL, for: indexPath) as! PaginatedItemCell
        
        cell.displayView = self.controllers[indexPath.row].view
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = targetContentOffset.pointee.x / self.view.frame.width
        
        self.menuBar.collectionView.selectItem(at: IndexPath(item: Int(index), section: 0), animated: true, scrollPosition: .centeredHorizontally)
    }
    
}
