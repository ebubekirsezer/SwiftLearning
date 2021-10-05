//
//  ViewController.swift
//  StarWarsApp
//
//  Created by Ebubekir Sezer on 6.04.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        StarWarsNetwork.shared.request(path: "people") { (response) in
            switch response {
            case .success(let characters):
                print(characters)
            case .failure(let error):
                print(error)
            }
        }
    }


}

