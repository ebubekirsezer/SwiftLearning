//
//  DetailViewController.swift
//  PersonCard
//
//  Created by Ebubekir Sezer on 8.12.2020.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameSurnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    
    var nameSurname = "Ebubekir Sezer"
    var age = "22"
    var height = "1.88"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameSurnameLabel.text = nameSurname
        ageLabel.text = age
        heightLabel.text = height
    }

    @IBAction func createNewPersonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
}
