//
//  CoinModel.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 5/21/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation
import CoreData
import RealmSwift
import Realm

class CoinApiClient {
    
    enum Result<Value> {
        case success(Value)
        case failure(Error)
    }
    
    func getCoins(with query: String, completion: ((Result<[Coin]>) -> Void)?) {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "api.coinmarketcap.com"
        urlComponents.path = "/v1/\(query)"
        
        guard let url = urlComponents.url else { fatalError("Could not create URL from components") }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: request) { (responseData, response, responseError) in
            
            DispatchQueue.main.async {
                
                if let error = responseError {
                    completion?(.failure(error))
                    
                } else if let jsonData = responseData {
                    let decoder = JSONDecoder()
                    
                    do {
                        let coins = try decoder.decode([Coin].self, from: jsonData)
                        let realm = try! Realm()
                        for coin in coins {
                            try! realm.write {
                                realm.add(coin)
                            }
                        }
                        completion?(.success(coins))
                       
                    } catch {
                        completion?(.failure(error))
                    }
                } else {
                    let error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey : "Data was not retrieved from request"]) as Error
                    
                    completion?(.failure(error))
                }
            }
        }
        task.resume()
    }

    class func sharedInstance() -> CoinApiClient {
        struct Singleton {
            static var sharedInstance = CoinApiClient()
        }
        return Singleton.sharedInstance
    }
}

