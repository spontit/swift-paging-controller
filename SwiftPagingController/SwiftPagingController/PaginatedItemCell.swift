//
//  PaginatedItemCell.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class PaginatedItemCell : UICollectionViewCell {
    
    var displayView : UIView! {
        didSet {
            for view in self.contentView.subviews {
                view.removeFromSuperview()
            }
            self.contentView.addSubview(self.displayView)
            self.displayView.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
            self.displayView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
            self.displayView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
            self.displayView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        }
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.contentView.backgroundColor = .white
        
    }
    
}
