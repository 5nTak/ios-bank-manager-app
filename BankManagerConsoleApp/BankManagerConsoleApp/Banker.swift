//
//  Banker.swift
//  BankManagerConsoleApp
//
//  Created by μ€μΈν on 2021/05/04.
//

import Foundation

final class Banker {
    var workTime: Double = 0
    let semaphore = DispatchSemaphore(value: 1)

    func bankerWorkProgress(customers: inout [Customer]) {
        while customers.count > 0 {
            semaphore.wait()
            let customer: Customer = customers.removeFirst()
            semaphore.signal()
            
            print("π’\(customer.waitNumber)λ² \(customer.tier.tierName)κ³ κ° \(customer.business.rawValue)μλ¬΄ μμ")
            
            switch customer.business {
            case .deposit:
                usleep(700000)
                self.workTime += 0.7
            default:
                usleep(1100000)
                self.workTime += 1.1
            }
            
            print("π΅\(customer.waitNumber)λ² \(customer.tier.tierName)κ³ κ° \(customer.business.rawValue)μλ¬΄ μλ£")
        }
    }

}
