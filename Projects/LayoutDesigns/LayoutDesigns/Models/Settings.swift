//
//  Settings.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 7.01.2021.
//

import UIKit

struct SettingsSection {
    let sectionName: String
    let settings: [Settings]
}

class Settings {
    let settingImage: UIImage
    let settingTitle: String
    let settingSubTitle: String
    
    init(settingImage: UIImage, settingTitle: String, settingSubTitle: String) {
        self.settingImage = settingImage
        self.settingTitle = settingTitle
        self.settingSubTitle = settingSubTitle
    }
    
    init(settingImage: UIImage, settingTitle: String) {
        self.settingImage = settingImage
        self.settingTitle = settingTitle
        self.settingSubTitle = ""
    }
}

