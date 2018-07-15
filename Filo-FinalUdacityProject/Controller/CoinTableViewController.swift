//
//  CoinTableViewController.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 5/19/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift
import Realm
import SnapKit

class CoinTableViewController: UITableViewController {
    
    var coins: [Coin] = []

    lazy var selectedCoin = self.coins
    
    let realm = try! Realm()
    let results = try! Realm().objects(Coin.self)
    var notificationToken: NotificationToken?
    
    lazy var indicator: UIActivityIndicatorView = {
        var indicator = UIActivityIndicatorView(frame: CGRect(x: 180, y: 250, width: 40, height: 40))
        indicator.activityIndicatorViewStyle = .white
        indicator.backgroundColor = .lightGray
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        return indicator
    }()
    
    @IBOutlet var coinTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        indicator.startAnimating()
        indicator.backgroundColor = UIColor.darkGray
        getCoinData()
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        try! realm.write {
            realm.deleteAll()
        }
        getCoinData()        
        coinTableView.reloadData()
    }
    
    func getCoinData() {
        
        self.indicator.backgroundColor = .darkGray
        self.indicator.startAnimating()

        CoinApiClient.sharedInstance().getCoins(with: "ticker") { (result) in
            
            switch result {
            case .success(let coins):
                self.coins = coins
                self.coinTableView.reloadData()
                self.indicator.stopAnimating()
                self.indicator.hidesWhenStopped = true
                
                try! self.realm.write {
                    self.realm.add(coins)
                }
                
            case .failure(let error):
                self.indicator.stopAnimating()
                self.indicator.isHidden = true
                Alert.pushAlert(controller: self, message: "There was an error with the request: \(String(describing: error.localizedDescription))")
            }
        }
        self.coinTableView.reloadData()
    }
}

extension CoinTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return results.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "coinCell", for: indexPath) as! CoinTableViewCell
        let coin = results[indexPath.row]
            cell.symbolLabel?.text = coin.symbol
            cell.nameLabel?.text = coin.name
            cell.priceLabel?.text = "$\(coin.price)"
        
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        guard let crypto = cryptos?[indexPath.row] else { return }
//        let vc = CryptoDetailViewController(crypto)
//        navigationController?.pushViewController(vc, animated: true)
//        tableView.deselectRow(at: indexPath, animated: true)
//    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coin = results[indexPath.row]
        let controller = CoinDetailViewController(coin)
        //let coin = results[indexPath.row]
//        let controller = storyboard!.instantiateViewController(withIdentifier: "CoinDetailViewController") as! CoinDetailViewController
//        controller.coin = coin
        navigationController!.pushViewController(controller, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
