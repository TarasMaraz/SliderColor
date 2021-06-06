//
//  Extensions.swift
//  SliderColor
//
//  Created by Тарас Панин on 06.06.2021.
//

import UIKit

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 4
        let currentString: NSString = textField.text! as NSString
        let newString: NSString = currentString.replacingCharacters(in: range, with: string) as NSString
        return newString.length <= maxLength
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else { return }
        if text.first == "." {
            textField.text = "0."
        }
        if text == "0" {
            textField.text = "0."
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case redTF:
            dataTranmision(from: redTF, to: redSlider, to: redValue)
        case greenTF:
            dataTranmision(from: greenTF, to: greenSlider, to: greenValue)
        case blueTF:
            dataTranmision(from: blueTF, to: blueSlider, to: blueValue)
        default:
            return
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func dataTranmision(from textField: UITextField, to slider: UISlider, to label: UILabel) {
        guard let textInput = textField.text else { return }
        guard let value = Float(textInput) else {
           
            return
        }
        if value >= 0 && value <= 1 {
            slider.value = value
            label.text = String(value)
            chengePalitra()
        } else {
       return
        }
    }
}

