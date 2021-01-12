//
//  ViewController.swift
//  TopMusicFinder
//
//  Created by Ebubekir Sezer on 12.01.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction private func fetchData(_ sender: UIButton) {
        let musicWebService = MusicWebService()
        musicWebService.fetchTopMusics { [weak self] result in
            switch result {
            case .failure(let error):
                print(error)
            case .success(let musics):
                print(musics)
            }
        }
    }
}

