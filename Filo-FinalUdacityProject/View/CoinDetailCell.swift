//
//  CoinDetailCell.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 7/12/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import UIKit

class CoinDetailCell: UITableViewCell {
    let detailLabel = UILabel()
    let titleLabel = UILabel()
    
    init(title: String, detail: String) {
        super.init(style: .default, reuseIdentifier: nil)
        detailLabel.text = detail
        titleLabel.text = title
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.font = UIFont.systemFont(ofSize: 16)
        
        // detailLabel.textColor = StyleConstants.color.secondaryGray
        
        addSubview(detailLabel)
        addSubview(titleLabel)
        
//        titleLabel.leadingAnchor == leadingAnchor + 12
//        titleLabel.centerYAnchor == centerYAnchor
//        
//        detailLabel.trailingAnchor == trailingAnchor - 12
//        detailLabel.centerYAnchor == centerYAnchor
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
