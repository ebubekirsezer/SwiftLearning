//
//  LoginViewController.swift
//  SwiftVip
//
//  Created by Ebubekir Sezer on 17.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginViewController: class {
	var router: ILoginRouter? { get set }
}

class LoginViewController: UIViewController {
	var interactor: ILoginInteractor?
	var router: ILoginRouter?

	override func viewDidLoad() {
        super.viewDidLoad()
		// do someting...
    }
}

extension LoginViewController: ILoginViewController {
	// do someting...
}

extension LoginViewController {
	// do someting...
}

extension LoginViewController {
	// do someting...
}
