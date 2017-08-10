//
//  SettingsViewController.swift
//  TipSee
//
//  Created by Kavita Gaitonde on 8/8/17.
//  Copyright © 2017 Kavita Gaitonde. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipSelectionControl: UISegmentedControl!
    
    @IBOutlet weak var currencySelectionControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        tipSelectionControl.selectedSegmentIndex = defaults.integer(forKey: "selectedTipIndex")
        currencySelectionControl.selectedSegmentIndex = defaults.integer(forKey: "selectedCurrencyIndex")
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func handleTipChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(sender.selectedSegmentIndex, forKey: "selectedTipIndex")
        defaults.synchronize()
    }

    @IBAction func handleCurrencyChange(_ sender: AnyObject) {
        let defaults = UserDefaults.standard
        defaults.set(sender.selectedSegmentIndex, forKey: "selectedCurrencyIndex")
        defaults.synchronize()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
