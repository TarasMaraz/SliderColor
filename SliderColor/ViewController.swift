//
//  ViewController.swift
//  SliderColor
//
//  Created by Тарас Панин on 21.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var palitra: UIStackView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueVlue: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        redValue.text = "0.50"
        greenValue.text = "0.50"
        blueVlue.text = "0.50"
    }

    @IBAction func slidedRed(_ sender: Any) {
        redValue.text = String(format: "%.2f", redSlider.value)
        chengePalitra()
    }
    
    @IBAction func slidedGreen(_ sender: Any) {
        greenValue.text = String(format: "%.2f", greenSlider.value)
        chengePalitra()
    }
    
    @IBAction func slidedBlue(_ sender: Any) {
        blueVlue.text = String(format: "%.2f", blueSlider.value)
        chengePalitra()
    }
    
    func chengePalitra() {
        palitra.backgroundColor = UIColor(
            displayP3Red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1)
     
    }
    
}

