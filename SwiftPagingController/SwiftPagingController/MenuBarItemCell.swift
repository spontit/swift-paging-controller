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
    
    static let SIDE_PADDING : CGFloat = 5
    
    // MARK: -Globals
    var title : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.textColor = .black
        lbl.font = UIFont.systemFont(ofSize: 16)
        return lbl
    }()
    
    var selectionBar : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.heightAnchor.constraint(equalToConstant: 5).isActive = true
        return view
    }()
    
    
    
    // MARK: -Overriden Functions
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    override var isHighlighted: Bool {
        didSet {
            self.title.textColor = isHighlighted ? .white : .black
            self.selectionBar.isHidden = !isHighlighted
        }
    }
    
    override var isSelected: Bool {
        didSet {
            self.title.textColor = isSelected ? .white : .black
            self.selectionBar.isHidden = !isSelected
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
        
        self.contentView.addSubview(self.selectionBar)
        self.selectionBar.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0).isActive = true
        self.selectionBar.widthAnchor.constraint(equalToConstant: self.contentView.frame.width).isActive = true
        self.selectionBar.isHidden = true
    }
}
