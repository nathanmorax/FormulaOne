//
//  ReusableHeaderView.swift
//  FormulaOne
//
//  Created by Xcaret Mora on 12/06/24.
//

import UIKit

class ReusableHeaderView: UICollectionReusableView {
    static let headerId = "headerId"
    var titleLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        titleLabel.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
