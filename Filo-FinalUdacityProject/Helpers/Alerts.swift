//
//  Alerts.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 6/1/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//
 
import Foundation
import UIKit

// MARK: - Alert
class Alert {
    
    // pushAlert Method
    class func pushAlert(controller: UIViewController, message: String) {
        let alert = UIAlertController(title: "Something is wrong.", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        
        performUIUpdatesOnMain {
            controller.present(alert, animated: true, completion: nil)
        }
    }
}
