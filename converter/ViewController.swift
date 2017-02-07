//
//  ViewController.swift
//  converter
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 bsuir. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    let converter = ConverterModel()
    
    @IBOutlet weak var editBYN: UITextField!
    @IBOutlet weak var labelRUB: UILabel!
    @IBOutlet weak var labelUSD: UILabel!
    @IBOutlet weak var labelEUR: UILabel!
    
    @IBAction func buttonConvertClick(_ sender: Any) {
        if let valueInBYN = getValueInBYN() {
            let converted = converter.getConvertedValues(valueInBYN: valueInBYN)
            showResult(converted: converted)
        } else {
            handleInvalidInput()
        }
    }
    
    func getValueInBYN() -> Double?{
        var result: Double?
        if (editBYN.text ?? "").isEmpty {
            result = 1.0
        } else {
            result = Double(editBYN.text!)
        }
        return result
    }
    
    func handleInvalidInput() {
        editBYN.text = nil
        showRates()
        showAlert()
    }
    
    func showRates() {
        showResult(converted: converter.getRates())
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Error", message: "Invalid input.", preferredStyle:.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        show(alertController, sender:self)
    }
    
    func showResult(converted: [Currency:Double]){
        labelUSD.text = "\(Currency.USD): \(converted[Currency.USD]!)"
        labelEUR.text = "\(Currency.EUR): \(converted[Currency.EUR]!)"
        labelRUB.text = "\(Currency.RUB): \(converted[Currency.RUB]!)"
    }
}

