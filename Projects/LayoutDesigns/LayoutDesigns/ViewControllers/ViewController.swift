//
//  ViewController.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func nestedStackViewPressed(_ sender: UIButton) {
        goToAny(viewController: NestedStackViewController(), from: "NestedStackViews")
    }
}

extension ViewController {
    
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
                
        show(nextViewController, sender: self)
    }
}

