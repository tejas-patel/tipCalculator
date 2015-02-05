//
//  ViewController.swift
//  SmartPlanner
//
//  Created by Tejas Patel on 1/29/15.
//  Copyright (c) 2015 SwiftStack. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tipCalc = TipCalc(total: 0, taxPct: 0.10)
    @IBOutlet weak var finalTip: UILabel!
    @IBOutlet weak var total: UITextField!
    @IBOutlet weak var taxPercent: UILabel!
    @IBOutlet weak var tipPercent: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var taxP: UILabel!
    @IBOutlet weak var tipP: UILabel!
    @IBOutlet weak var taxOutlet: UILabel!
    @IBOutlet weak var tipOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        var tip = tipCalc.calcTipWithTipPct(Double(taxSlider.value))
        finalTip.text=String(format: "%0.2f", tip)
        taxOutlet.text=taxSlider.value.description
        tipOutlet.text=tipSlider.value.description
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipChange(sender: UISlider) {
        var inc: Int=Int(tipSlider.value+0.5)
        tipSlider.value=Float(inc)
        tipOutlet.text=tipSlider.value.description
        var tip = tipCalc.calcTipWithTipPct(Double(tipSlider.value)/100)
        finalTip.text=String(format: "%0.2f", tip)
    }
    @IBAction func taxChange(sender: AnyObject) {
        var inc: Int=Int(taxSlider.value+0.5)
        taxSlider.value=Float(inc)
        taxOutlet.text=taxSlider.value.description
        tipCalc.taxPct=Double(taxSlider.value)/100
        var tip = tipCalc.calcTipWithTipPct(Double(tipSlider.value)/100)
        finalTip.text=String(format: "%0.2f", tip)
    }
    @IBAction func updateTotal(sender: AnyObject) {
    }
    
    @IBOutlet var dismissKey: UITapGestureRecognizer!

    @IBAction func dismissKeyboard(sender: AnyObject) {
        tipCalc.total=Double((total.text as NSString).doubleValue)
        var tip = tipCalc.calcTipWithTipPct(Double(tipSlider.value)/100)
        finalTip.text=String(format: "%0.2f", tip)
        print("totalchanged")

        total.resignFirstResponder()
        
    }
}

