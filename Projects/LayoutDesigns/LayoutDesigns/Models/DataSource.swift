//
//  DataSource.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class DataSource {
    static let people: [Person] = [
        Person(username: "@ebubekirsezer", name: "Ebubekir", surname: "Sezer", profilePicture: #imageLiteral(resourceName: "whatsapp"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            
        ]),
        Person(username: "@sjobs", name: "Steve", surname: "Jobs", profilePicture: #imageLiteral(resourceName: "jobs"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ]),
        Person(username: "@gates", name: "Bill", surname: "Gates", profilePicture: #imageLiteral(resourceName: "gates"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ]),
        Person(username: "@bezos", name: "Jeff", surname: "Bezos", profilePicture: #imageLiteral(resourceName: "bezos"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1),
            
        ]),
        Person(username: "@musk", name: "Elon", surname: "Musk", profilePicture: #imageLiteral(resourceName: "musk"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ]),
        Person(username: "@wozniak", name: "Steve", surname: "Wozniak", profilePicture: #imageLiteral(resourceName: "wozniak"), posts: [
            Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "whatsapp"), postLike: 15, isLiked: true, comments: 3, shared: 1)
        ])
    ]
    
    static let settings : [SettingsSection] = [
        
        SettingsSection(sectionName: "Ayarlar", settings: [
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ebubekir Sezer", settingSubTitle: "Apple Kimliği, iCloud, Ortamlar ve Satın Alma")
        ]),
        SettingsSection(sectionName: " ", settings: [
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Uçak Modu"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Wi-Fi"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Bluetooth"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Hücresel"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Kişisel Erişim Noktası")
        ]),
        SettingsSection(sectionName: " ", settings: [
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Bildirimler"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ses ve Dokunuş"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Rahatsız Etme"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ekran Süresi")
        ]),
        SettingsSection(sectionName: " ", settings: [
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Genel"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Denetim Merkezi"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ekran ve Parlaklık"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ana Ekran"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Genel"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Denetim Merkezi"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ekran ve Parlaklık"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Ana Ekran")
        ]),
        SettingsSection(sectionName: " ", settings: [
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Uçak Modu"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Wi-Fi"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Bluetooth"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Hücresel"),
            Settings(settingImage: UIImage(systemName: "trash.fill")!, settingTitle: "Kişisel Erişim Noktası")
        ])
    ]
}
