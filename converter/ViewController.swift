//
//  ViewController.swift
//  converter
//
//  Created by Admin on 07.02.17.
//  Copyright © 2017 bsuir. All rights reserved.
//

import UIKit

enum Currency{
    case USD, EUR, RUB
    func getRate() -> Double {
        switch self {
        case .EUR: return 0.4866
        case .USD: return 0.5216
        case .RUB: return 30.8166
        }
    }
}

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var editBYN: UITextField!
    @IBOutlet weak var labelRUB: UILabel!
    @IBOutlet weak var labelUSD: UILabel!
    @IBOutlet weak var labelEUR: UILabel!
    
    @IBAction func buttonConvertClick(_ sender: Any) {
        var valueInBYN: Double?;
        if (editBYN.text ?? "").isEmpty {
            valueInBYN = 1.0
        } else {
            valueInBYN = Double(editBYN.text!)
        }
        if valueInBYN != nil {
            viewRates(valueInBYN: valueInBYN!)
        } else {
            handleInvalidInput()
        }
    }
    
    func handleInvalidInput() {
        editBYN.text = nil
        viewRates(valueInBYN: 1.0)
        showAlert()
    }
    
    func showAlert(){
        let alertController = UIAlertController(title: "Error", message: "Invalid input.", preferredStyle:.alert)
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(defaultAction)
        show(alertController, sender:self)
    }
    
    func viewRates(valueInBYN: Double){
        labelUSD.text = "\(Currency.USD): \(valueInBYN*Currency.USD.getRate())"
        labelEUR.text = "\(Currency.EUR): \(valueInBYN*Currency.EUR.getRate())"
        labelRUB.text = "\(Currency.RUB): \(valueInBYN*Currency.RUB.getRate())"
    }
}

