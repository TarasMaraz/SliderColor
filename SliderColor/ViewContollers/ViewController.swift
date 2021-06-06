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
    @IBOutlet var blueValue: UILabel!
    
    @IBOutlet var redTF: UITextField!
    @IBOutlet var greenTF: UITextField!
    @IBOutlet var blueTF: UITextField!
    
    var delegate: ChengeBackGroundColor!
    var color: UIColor!
    
    
    @IBOutlet var doneBut: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palitra.layer.cornerRadius = 15
        
        redTF.delegate = self
        greenTF.delegate = self
        blueTF.delegate = self
        
        redTF.keyboardType = .numberPad
        greenTF.keyboardType = .numberPad
        blueTF.keyboardType = .numberPad
        
        addDoneButtonTo(redTF)
        addDoneButtonTo(greenTF)
        addDoneButtonTo(blueTF)
        
        setLabels()
        setTextFields()
        chengePalitra()
        
        setValueFromViewColor()
    }
    
    
    @IBAction func sliderActions(_ sender: UISlider) {
        chengePalitra()
        setLabels()
        setTextFields()
    }
    
    private func setLabels() {
        redValue.text = String(format: "%.2f", redSlider.value)
        greenValue.text = String(format: "%.2f", greenSlider.value)
        blueValue.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func setTextFields() {
        redTF.text = String(format: "%.2f", redSlider.value)
        greenTF.text = String(format: "%.2f", greenSlider.value)
        blueTF.text = String(format: "%.2f", blueSlider.value)
    }

    func chengePalitra() {
        palitra.backgroundColor = UIColor(
            red: CGFloat(redSlider!.value),
            green: CGFloat(greenSlider!.value),
            blue: CGFloat(blueSlider!.value),
            alpha: 1)
    }
    
    @IBAction func doneColorButton(_ sender: Any) {
        delegate.setupViewColor(palitra.backgroundColor ?? .white)
        dismiss(animated: true)
    }
    
    private func setValueFromViewColor() {
        let ciColor = CIColor(color: color)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
        chengePalitra()
    }
}

extension ViewController {
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title:"Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        self.view.endEditing(true)
    }
}


