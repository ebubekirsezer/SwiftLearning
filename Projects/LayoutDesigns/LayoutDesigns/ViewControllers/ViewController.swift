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

    @IBAction private func nestedStackViewPressed(_ sender: UIButton) {
        goToAny(viewController: NestedStackViewController(), from: "NestedStackViews")
    }
    
    @IBAction private func contraintsButtonPressed(_ sender: UIButton) {
        goToAny(viewController: BlueViewController(), from: "NestedStackViews")
    }
    
    @IBAction private func equalWidthsPressed(_ sender: UIButton) {
        goToAny(viewController: EqualWidthsController(), from: "NestedStackViews")
    }
    
    @IBAction private func differentWidthsPressed(_ sender: UIButton) {
        goToAny(viewController: DifferentWidthsViewController(), from: "NestedStackViews")
    }
    
    @IBAction private func complexWidthsPressed(_ sender: UIButton) {
        goToAny(viewController: ComplexWidthsViewController(), from: "NestedStackViews")
    }
}

extension UIViewController {
    
    func goToAny<T: UIViewController>(viewController: T, from storyboardName: String){
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        guard let nextViewController = storyboard.instantiateViewController(identifier: String(describing: T.self)) as? T else { return }
                
        show(nextViewController, sender: self)
    }
}

