//
//  ViewController.swift
//  DesignProject
//
//  Created by Ebubekir Sezer on 22.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var buttonGo: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var progressScore: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var switchControl: UISwitch!
    @IBOutlet weak var switchValue: UILabel!
    @IBOutlet weak var sliderValue: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Design Project"
                
        activityIndicator?.color = UIColor.red
        activityIndicator?.startAnimating()
        activityIndicator?.hidesWhenStopped = true
        
        textField?.isHidden = true
        slider?.isHidden = true
        sliderValue?.isHidden = true
        switchValue?.text = switchControl.isOn ? "On" : "Off"
        buttonGo?.isEnabled = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.activityIndicator?.stopAnimating()
            self.imageView?.image = #imageLiteral(resourceName: "protel")
            self.progressBar?.setProgress(1.0, animated: true)
            self.progressScore?.text = "% 100"
            self.buttonGo?.isEnabled = true
        }
    }


    @IBAction func goToSecondVC(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondVC = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController

        if !(textField.text?.isEmpty ?? true){
            secondVC.initializeWith(info: textField.text!)
        }
        
        secondVC.modalPresentationStyle = .fullScreen
        secondVC.modalTransitionStyle = .crossDissolve
        show(secondVC, sender: self)
        
        //performSegue(withIdentifier: "goToSecondVC", sender: self)
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "goToSecondVC"{
//            let destinationVC = segue.destination as! SecondViewController
//
//            if let infoText = textField.text {
//                destinationVC.info = infoText
//            }
//        }
//    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 0:
            switchValue.isHidden = false
            switchControl.isHidden = false
            textField.isHidden = true
            slider.isHidden = true
            sliderValue.isHidden = true
        case 1:
            switchValue.isHidden = true
            switchControl.isHidden = true
            textField.isHidden = false
            slider.isHidden = true
            sliderValue.isHidden = true
        default:
            switchValue.isHidden = true
            switchControl.isHidden = true
            textField.isHidden = true
            slider.isHidden = false
            sliderValue.isHidden = false
        }
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        sliderValue.text = String(format: "Age: %.f", sender.value)
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        switchValue.text = sender.isOn ? "On" : "Off"
    }
}

