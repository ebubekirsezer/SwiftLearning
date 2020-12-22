//
//  SecondViewController.swift
//  DesignProject
//
//  Created by Ebubekir Sezer on 22.12.2020.
//

import UIKit

class SecondViewController: UIViewController{
    
    @IBOutlet weak var textInfo: UILabel!

    private var info: String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textInfo.text = "Info: \(info ?? "No Info entered")"
    }
    
    func initializeWith(info: String){
        self.info = info
    }
    
    

}
