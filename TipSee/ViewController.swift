//
//  ViewController.swift
//  TipSee
//
//  Created by Kavita Gaitonde on 8/6/17.
//  Copyright © 2017 Kavita Gaitonde. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var selectedTipLabel: UILabel!
    
    @IBOutlet weak var splitStepper: UIStepper!
    
    @IBOutlet weak var splitCountLabel: UILabel!
    
    @IBOutlet weak var splitTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Do any additional setup after loading the view, typically from a nib.
        let defaults = UserDefaults.standard
        let lastBillAmount = defaults.double(forKey: "lastBillAmount")
        let lastBillDate = defaults.object(forKey: "lastBillDate") as? Date
        let timeInterval: Double = (lastBillDate != nil) ? NSDate.init().timeIntervalSince(lastBillDate! as Date) : Double(0);
        
        if(lastBillAmount > 0 && timeInterval < 120 ) {
            billTextField.text = "\(lastBillAmount)"
        } else {
            billTextField.text = "";
        }
        calculateTip()
        billTextField.becomeFirstResponder()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func handleTipSelection(_ sender: AnyObject) {
        calculateTip()
    }

    @IBAction func handleBillInput(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        let bill = Double(sender.text!) ?? 0
        defaults.set(bill, forKey: "lastBillAmount")
        defaults.set(Date(), forKey: "lastBillDate")
        defaults.synchronize()
        calculateTip()
    }
    
    func calculateTip() {
        let tips = [0.15, 0.18, 0.2]
        let currencies = ["$", "£", "€"]
        let defaults = UserDefaults.standard
        let tipIndex = defaults.integer(forKey: "selectedTipIndex")
        let currencyIndex = defaults.integer(forKey: "selectedCurrencyIndex")
        
        let bill = Double(billTextField.text!) ?? 0
        let tip = bill * tips[tipIndex]
        let total = bill + tip
        
        let splitCount = splitStepper.value
        let splitTotal = total / splitCount
        
        selectedTipLabel.text = String (format:"(%.0f%%)", tips[tipIndex]*100)
        tipLabel.text =  String (format:"%@%.2f", currencies[currencyIndex], tip)
        totalLabel.text = String (format:"%@%.2f", currencies[currencyIndex], total)
        splitCountLabel.text = String (format:"%.0f", splitCount)
        splitTotalLabel.text = String (format:"%@%.2f", currencies[currencyIndex], splitTotal)
    }
    
    @IBAction func handleSplitStepperValueChanged(_ sender: AnyObject) {
        calculateTip()
    }
    
    @IBAction func handleTap(_ sender: AnyObject) {
        view.endEditing(true)
    }
}

