//
//  PriceFormatter.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 7/12/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation

extension Double {
    
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        
        return (self * divisor).rounded() / divisor
    }
}
