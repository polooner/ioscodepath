//
//  ViewController.swift
//  First App
//
//  Created by Polo on 12/21/22.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBlue
        semesterSlider.minimumTrackTintColor = .red
        semesterSlider.maximumTrackTintColor = .white
        semesterSlider.thumbTintColor = .black

    }

    @IBOutlet weak var schoolNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var majorTextField: UITextField!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var stepperControl: UIStepper!
    @IBOutlet weak var numberOfPetsLabel: UILabel!
    @IBOutlet weak var introduceBtn: UIButton!
    @IBOutlet weak var semesterSlider: UISlider!
    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberOfPetsLabel.text = "\(Int(sender.value))"
    }
    
    
    @IBAction func introduceDidTap(_ sender: UIButton) {
        
        let firstName: String = firstNameTextField.text!
        let lastName: String = lastNameTextField.text!
        let majorName: String = majorTextField.text!
        let year: String = segmentedControl.titleForSegment(at: segmentedControl.selectedSegmentIndex)!
        let numberOfPets: String = numberOfPetsLabel.text!
        let morePetsSwitch: Bool = morePetsSwitch.isOn
        let semesterMood: Float = semesterSlider.value
        
        var introduction = """
My name is \(String(describing: firstName)) \(String(describing: lastName)). I attend \(String(describing: majorName)) and major in \(String(describing: majorName)). I am currently in my \(String(describing: year)) year and this semester has been \(Float(semesterMood))% ok. I own \(String(describing: numberOfPets)) pets. It is \(String(describing: morePetsSwitch)) that I want more pets.
"""
        
        if firstNameTextField.text?.isEmpty == true || lastNameTextField.text?.isEmpty == true || schoolNameTextField.text?.isEmpty == true || majorTextField.text?.isEmpty == true {
            let alertController = UIAlertController(title: "Missing info", message: "Missing fields, please check", preferredStyle: .alert)
            
            alertController.view.subviews.first?.backgroundColor = UIColor.red
            alertController.view.tintColor = UIColor.white
            
            let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
            
            alertController.addAction(action)
            
            present(alertController, animated: true, completion: nil)
        } else {
            let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            
            let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
    }
}

