//
//  CoinDetailViewController.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 6/5/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import UIKit

class CoinDetailViewController: UIViewController {
    
    var coin: Coin?

    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var marketCapLabel: UILabel!
    @IBOutlet weak var rankLabel: UILabel!
    @IBOutlet weak var dayVolumeLabel: UILabel!
    @IBOutlet weak var totalSupplyLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        symbolLabel?.text = coin?.symbol
        nameLabel?.text = coin?.name
        priceLabel?.text = coin?.price
        marketCapLabel?.text = coin?.marketCap
        rankLabel?.text = coin?.rank
        dayVolumeLabel?.text = coin?.dayVolume
        totalSupplyLabel?.text = coin?.totalSupply
    }
}
