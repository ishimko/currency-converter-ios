//
//  ConverterModel.swift
//  converter
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 bsuir. All rights reserved.
//

import Foundation

enum Currency{
    case USD, EUR, RUB
    
    func getRate() -> Double {
        switch self {
        case .EUR: return 0.4866
        case .USD: return 0.5216
        case .RUB: return 30.8166
        }
    }
    
    func fromBYN(valueInBYN: Double) -> Double {
        return self.getRate()*valueInBYN
    }
}

class ConverterModel {
    func getConvertedValues(valueInBYN: Double) -> [Currency: Double] {
        return [
            Currency.EUR : Currency.EUR.fromBYN(valueInBYN: valueInBYN),
            Currency.USD : Currency.USD.fromBYN(valueInBYN: valueInBYN),
            Currency.RUB : Currency.RUB.fromBYN(valueInBYN: valueInBYN)
        ]
    }
    
    func getRates() -> [Currency: Double] {
        return getConvertedValues(valueInBYN: 1.0)
    }
}
