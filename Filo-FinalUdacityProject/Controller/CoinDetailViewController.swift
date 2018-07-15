//
//  CoinDetailViewController.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 6/5/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import UIKit

//class CoinDetailViewController: UIViewController {
//    
//    var coin: Coin?
//
//    @IBOutlet weak var symbolLabel: UILabel!
//    @IBOutlet weak var nameLabel: UILabel!
//    @IBOutlet weak var priceLabel: UILabel!
//    @IBOutlet weak var marketCapLabel: UILabel!
//    @IBOutlet weak var rankLabel: UILabel!
//    @IBOutlet weak var dayVolumeLabel: UILabel!
//    @IBOutlet weak var totalSupplyLabel: UILabel!
//    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(true)
//        
//        symbolLabel?.text = coin?.symbol
//        nameLabel?.text = coin?.name
//        priceLabel?.text = coin?.price
//        marketCapLabel?.text = coin?.marketCap
//        rankLabel?.text = coin?.rank
//        dayVolumeLabel?.text = coin?.dayVolume
//        totalSupplyLabel?.text = coin?.totalSupply
//    }
//}
//

////////////////////  Implementation of section detail view controller ->

class CoinDescriptionCell: UITableViewCell {
    let coinDescription: String
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 12)
        label.text = self.coinDescription
        return label
    }()
    
    init(coinDescription: String) {
        self.coinDescription = coinDescription
        super.init(style: .default, reuseIdentifier: nil)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class CoinDetailViewController: UITableViewController {
    let coin: Coin
    lazy var sections = self.makeCells(for: self.coin)
    
    struct DetailSection {
        let title: String
        let cells: [UITableViewCell]
    }
    
    func makeCells(for coin: Coin) ->  [DetailSection] {
        
        let name = CoinDetailCell(title: "Name", detail: coin.name)
        let symbol = CoinDetailCell(title: "Symbol", detail: coin.symbol)
        let rank = CoinDetailCell(title: "Rank", detail: String(coin.rank))
        let price = CoinDetailCell(title: "USD Price", detail: coin.price)
        let marketCap = CoinDetailCell(title: "Market Cap", detail: coin.marketCap)
        
        let infoSection = DetailSection(title: "Information", cells: [name, symbol, rank, price, marketCap])
        let priceSection = DetailSection(title: "Prices", cells: [price])
      
        let sections: [DetailSection] = [infoSection, priceSection]
        
        return sections
    }
    
    init(_ coin: Coin) {
        self.coin = coin
        super.init(nibName: nil, bundle: nil)
        title = coin.symbol
        
        tableView.tableFooterView = UIView()
        tableView.allowsSelection = false
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 40
       // navigationItem.titleView = titleImage
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        let title = UILabel()
        title.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        view.addSubview(title)
        title.text = sections[section].title
        return view
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sections[section].cells.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.sections[indexPath.section].cells[indexPath.row]
    }
}
