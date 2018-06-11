//
//  GCD.swift
//  Filo-FinalUdacityProject
//
//  Created by Travis McCormick on 6/1/18.
//  Copyright © 2018 Travis McCormick. All rights reserved.
//

import Foundation

func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
    
}
