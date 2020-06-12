//
//  MenuBarItemCell.swift
//  SwiftPagingController
//
//  Created by Zhang Qiuhao on 6/12/20.
//  Copyright © 2020 Zhang Qiuhao. All rights reserved.
//

import Foundation
import UIKit

class MenuBarItemCell : UICollectionViewCell {
    // MARK: -Globals
    var title : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        return lbl
    }()
    
    // MARK: -Overriden Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.title.textColor = isHighlighted ? .white : .black
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.title.textColor = isSelected ? .white : .black
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Helpler Functions
    private func setUp() {
        self.contentView.addSubview(self.title)
        self.backgroundColor = .gray

        self.title.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        self.title.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
}
