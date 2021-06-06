//
//  ColorViewController.swift
//  SliderColor
//
//  Created by Тарас Панин on 06.06.2021.
//

import UIKit

class ColorViewController: UIViewController, ChengeBackGroundColor {
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let colorSetupViewController = segue.destination as! ViewController
        colorSetupViewController.delegate = self
        colorSetupViewController.color = view.backgroundColor
    }
    
    func setupViewColor(_ color: UIColor) {
        view.backgroundColor = color
    }
    
  
}
