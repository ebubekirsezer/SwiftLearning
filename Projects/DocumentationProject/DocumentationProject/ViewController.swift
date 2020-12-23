//
//  ViewController.swift
//  DocumentationProject
//
//  Created by Ebubekir Sezer on 23.12.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var createButton: UIButton!
    @IBOutlet weak var tableViewButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let quote = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
        
        infoLabel.text = quote
        infoLabel.numberOfLines = 0
        infoLabel.lineBreakMode = NSLineBreakMode.byTruncatingMiddle
        
        createButton.backgroundColor = #colorLiteral(red: 0.09808254987, green: 0.26281178, blue: 0.2842366695, alpha: 1)
        createButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        createButton.tintColor = UIColor.white
        createButton.setTitleColor(UIColor.white, for: .normal)
        createButton.setTitle("Go to Collection VC", for: .normal)
        createButton.layer.cornerRadius = createButton.bounds.height / 2
        
        tableViewButton.backgroundColor = #colorLiteral(red: 0.09808254987, green: 0.26281178, blue: 0.2842366695, alpha: 1)
        tableViewButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        tableViewButton.tintColor = UIColor.white
        tableViewButton.setTitleColor(UIColor.white, for: .normal)
        tableViewButton.setTitle("Go to Table VC", for: .normal)
        tableViewButton.layer.cornerRadius = createButton.bounds.height / 2
        
//        let font = UIFont.systemFont(ofSize: 24)
//        let shadow = NSShadow()
//        shadow.shadowColor = UIColor.yellow
//        shadow.shadowBlurRadius = 2
//
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.alignment = .center
//        paragraphStyle.firstLineHeadIndent = 5.0
//        let attribute : [NSAttributedString.Key: Any] = [ .font: font, .foregroundColor: UIColor.red, .shadow: shadow, .paragraphStyle: paragraphStyle]
//        infoLabel.attributedText = NSAttributedString(string: quote,attributes: attribute)
        
    }

    
    
// Creating Programatically View
//        let rect = CGRect(x: 10, y: 10, width: 100, height: 100)
//        let myView = UIView(frame: rect)
//        //changing the background color of the view
//        myView.backgroundColor = UIColor.red
//        //changing the visibility of view
//        myView.isHidden = false
//        // opacity of the view
//        myView.alpha = CGFloat(1)
//        //
//        myView.isOpaque = true
//
//        myView.tintColor = UIColor.yellow
//
//        //myView.bounds = CGRect(x: 150, y: 150, width: 100, height: 100  )
//        view.addSubview(myView)

    @IBAction func goToCollectionVC(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let collectionVC = storyboard.instantiateViewController(identifier: "CollectionViewController") as! CollectionViewController
        
        collectionVC.modalPresentationStyle = .fullScreen
        collectionVC.modalTransitionStyle = .crossDissolve
        
        show(collectionVC, sender: self)
    }
    @IBAction func goToTableVC(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let tableVC = storyboard.instantiateViewController(identifier: "TableViewController") as! TableViewController
        
        tableVC.modalPresentationStyle = .fullScreen
        tableVC.modalTransitionStyle = .crossDissolve
        
        show(tableVC, sender: self)
    }
}

