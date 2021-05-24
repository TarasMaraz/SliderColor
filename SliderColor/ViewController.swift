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
    
    @IBOutlet var alphaSlider: UISlider!
    
    @IBOutlet var redValue: UILabel!
    @IBOutlet var greenValue: UILabel!
    @IBOutlet var blueVlue: UILabel!
    
    @IBOutlet var resetBut: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palitra.layer.cornerRadius = 15
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
    
    
    @IBAction func slidedAlpha(_ sender: Any) {
        chengePalitra()
    }
    
    
    func chengePalitra() {
        palitra.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: CGFloat(alphaSlider.value))
    }
    
    
    @IBAction func resetedColor(_ sender: Any) {
        resetBut.setTitle("Reset", for: .normal)
        
        redSlider.value = 0
        greenSlider.value = 0
        blueSlider.value = 0
        alphaSlider.value = 1
        
        slidedRed(0)
        slidedBlue(0)
        slidedGreen(0)
    
        
        chengePalitra()
    }
    
}

