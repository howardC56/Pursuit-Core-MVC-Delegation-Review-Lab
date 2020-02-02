//
//  ChangeFontViewController.swift
//  MVC+Delegation-Review-Lab
//
//  Created by Howard Chang on 2/1/20.
//  Copyright © 2020 Benjamin Stone. All rights reserved.
//

import UIKit

protocol viewControllerTextSizeDelegate: class {
    func changeSize(value: CGFloat)
}

class ChangeFontViewController: UIViewController {

    @IBOutlet weak var sizeSlider: UISlider!
    @IBOutlet weak var sizeStepper: UIStepper!
    @IBOutlet weak var sizeLabel: UILabel!
    
    weak var delegate: viewControllerTextSizeDelegate?
    var currentFontSize: Double = 14.0
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
   private func setup() {
        sizeStepper.value = currentFontSize
        sizeSlider.value = Float(currentFontSize)
        sizeLabel.text = "Preview Font Size: \(String(format:"%0.f",sizeStepper.value))"
    }
    
    @IBAction func stepperChanged(_ sender: UIStepper) {
        sizeStepper.value = sender.value
        sizeLabel.text = "Preview Font Size: \(String(format:"%0.f",sender.value))"
        delegate?.changeSize(value: CGFloat(sender.value))
        sizeSlider.value = Float(sender.value)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider ) {
        sizeSlider.value = sender.value
        sizeLabel.text = "Preview Font Size: \(String(format:"%0.f",sender.value))"
        delegate?.changeSize(value: CGFloat(sender.value))
        sizeStepper.value = Double(sender.value)
    }


}

