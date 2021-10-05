//
//  LoginPresenter.swift
//  SwiftVip
//
//  Created by Ebubekir Sezer on 17.04.2021.
//  Copyright (c) 2021 ___ORGANIZATIONNAME___. All rights reserved.
//  Modify By:  * Ari Munandar
//              * arimunandar.dev@gmail.com
//              * https://github.com/arimunandar

import UIKit

protocol ILoginPresenter: class {
	// do someting...
}

class LoginPresenter: ILoginPresenter {	
	weak var view: ILoginViewController?
	
	init(view: ILoginViewController?) {
		self.view = view
	}
}
