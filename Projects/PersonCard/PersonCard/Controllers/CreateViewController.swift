//
//  ViewController.swift
//  PersonCard
//
//  Created by Ebubekir Sezer on 8.12.2020.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var nameSurnameTextField: UITextField!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var nameSurname = ""
    var height = 0.0
    var age = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func ageChanged(_ sender: UIStepper) {
        age = Int(sender.value)
        let ageString = String(age)
        
        ageLabel.text = ageString
    }
    
    @IBAction func heightChanged(_ sender: UISlider) {
        height = Double(sender.value)
        let heightString = String(format: "%.2f", height)
        heightLabel.text = heightString
    }
    
    @IBAction func createPersonClicked(_ sender: UIButton) {
        nameSurnameTextField.endEditing(true)
        if let nameSurnameNotNil = nameSurnameTextField.text{
            nameSurname = nameSurnameNotNil
        }
        
        self.performSegue(withIdentifier: "goToDetail", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToDetail"{
            
            let destinationVC = segue.destination as! DetailViewController
            
            destinationVC.nameSurname = nameSurname
            destinationVC.age = String(age)
            destinationVC.height = String(format: "%.2f", height)
        }
    }
}

