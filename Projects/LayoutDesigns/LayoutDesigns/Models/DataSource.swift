//
//  DataSource.swift
//  LayoutDesigns
//
//  Created by Ebubekir Sezer on 6.01.2021.
//

import UIKit

class DataSource {
    static let people: [Person] = [
        Person(username: "@ebubekirsezer", name: "Ebubekir", surname: "Sezer", profilePicture: #imageLiteral(resourceName: "whatsapp")),
        Person(username: "@sjobs", name: "Steve", surname: "Jobs", profilePicture: #imageLiteral(resourceName: "jobs")),
        Person(username: "@gates", name: "Bill", surname: "Gates", profilePicture: #imageLiteral(resourceName: "gates")),
        Person(username: "@bezos", name: "Jeff", surname: "Bezos", profilePicture: #imageLiteral(resourceName: "bezos")),
        Person(username: "@musk", name: "Elon", surname: "Musk", profilePicture: #imageLiteral(resourceName: "musk")),
        Person(username: "@wozniak", name: "Steve", surname: "Wozniak", profilePicture: #imageLiteral(resourceName: "wozniak"))
    ]
    
    
    static let posts: [Post] = [
        Post(postDate: "2 sa", postPicture: nil, postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@ebubekirsezer", name: "Ebubekir", surname: "Sezer", profilePicture: #imageLiteral(resourceName: "whatsapp"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@sjobs", name: "Steve", surname: "Jobs", profilePicture: #imageLiteral(resourceName: "jobs"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@gates", name: "Bill", surname: "Gates", profilePicture: #imageLiteral(resourceName: "gates"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@bezos", name: "Jeff", surname: "Bezos", profilePicture: #imageLiteral(resourceName: "bezos"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@musk", name: "Elon", surname: "Musk", profilePicture: #imageLiteral(resourceName: "musk"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@wozniak", name: "Steve", surname: "Wozniak", profilePicture: #imageLiteral(resourceName: "wozniak"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@wozniak", name: "Steve", surname: "Wozniak", profilePicture: #imageLiteral(resourceName: "wozniak"))),
        Post(postDate: "2 sa", postPicture: #imageLiteral(resourceName: "square_flowers"), postDetail: "Swift has great feautres to code. Really enjoyed.", postLike: 15, isLiked: true, comments: 3, shared: 1, person: Person(username: "@wozniak", name: "Steve", surname: "Wozniak", profilePicture: #imageLiteral(resourceName: "wozniak"))),
        
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
    
    static let bankOperations: [BankOperation] = [
        BankOperation(title: "Hesaplarım", operation: Bank(bankAccountID: "123-456789 / MECIDIYEKOY", bankBalance: 10_000, bankLastCheck: "8 Ocak - 14:51", bankLastOperation: "Para Çekme", bankLastOperationBalance: 5_000, bankLastOperationDetail: "ATM PARA ÇEKME")),
        BankOperation(title: "Kartlarım", operation: Bank(bankAccountID: "BONUS GENC", bankBalance: 10_000, bankLastCheck: "8 Ocak", bankLastOperation: "Kart Ödemesi", bankLastOperationBalance: 5_000, bankLastOperationDetail: "Bonus Flaş Ödeme"))
    ]
}
